import 'package:vitals/core/errors/app_error.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/auth_models.dart';
import '../models/patient.dart' as data_models;
import '../models/user.dart' as data_models;
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/patient_entity.dart';
import '../../domain/repositories/auth_repository.dart';

/// 认证仓库实现
/// 协调远程和本地数据源，提供统一的数据访问接口
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  /// 转换方法：Data模型 -> Domain实体
  UserEntity _mapUserToEntity(data_models.User user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      phone: user.phone,
      email: user.email,
      avatarUrl: user.avatarUrl,
      createdAt: user.createdAt ?? DateTime.now(),
      updatedAt: user.updatedAt ?? DateTime.now(),
    );
  }

  PatientEntity _mapPatientToEntity(data_models.Patient patient) {
    return PatientEntity(
      id: patient.id,
      name: patient.name,
      idNumber: patient.idNumber,
      gender: _mapGenderToEntity(patient.gender),
      birthDate: patient.birthDate,
      phone: patient.phone,
      medicalRecordNumber: patient.medicalRecordNumber,
      emergencyContact: patient.emergencyContact,
      emergencyContactPhone: patient.emergencyContactPhone,
      createdAt: patient.createdAt ?? DateTime.now(),
      updatedAt: patient.updatedAt ?? DateTime.now(),
    );
  }

  Gender _mapGenderToEntity(data_models.Gender dataGender) {
    switch (dataGender) {
      case data_models.Gender.male:
        return Gender.male;
      case data_models.Gender.female:
        return Gender.female;
      case data_models.Gender.other:
        return Gender.other;
    }
  }

  LoginResult _mapLoginResponseToResult(LoginResponse response) {
    return LoginResult(
      user: _mapUserToEntity(response.user),
      token: response.token,
      patient: response.patient != null ? _mapPatientToEntity(response.patient!) : null,
    );
  }

  data_models.SignPatientRequest _mapSignPatientRequestToData(SignPatientRequest domainRequest) {
    return data_models.SignPatientRequest(
      name: domainRequest.name,
      idNumber: domainRequest.idNumber,
      gender: _mapGenderToData(domainRequest.gender),
      birthDate: domainRequest.birthDate,
      phone: domainRequest.phone,
      medicalRecordNumber: domainRequest.medicalRecordNumber,
      emergencyContact: domainRequest.emergencyContact,
      emergencyContactPhone: domainRequest.emergencyContactPhone,
    );
  }

  data_models.Gender _mapGenderToData(Gender entityGender) {
    switch (entityGender) {
      case Gender.male:
        return data_models.Gender.male;
      case Gender.female:
        return data_models.Gender.female;
      case Gender.other:
        return data_models.Gender.other;
    }
  }

  @override
  Future<Result<LoginResult, AppError>> login(String phone, {bool agreedToTerms = false}) async {
    try {
      final request = LoginRequest(phone: phone, agreedToTerms: agreedToTerms);
      final response = await _remoteDataSource.login(request);
      await saveAuthState(response);
      final result = _mapLoginResponseToResult(response);
      return Result.success(result);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<void, AppError>> logout() async {
    try {
      await _remoteDataSource.logout();
      await clearAuthState();
      return const Result.success(null);
    } on AppError catch (e) {
      // 即使远程登出失败，也要清理本地状态
      await clearAuthState();
      return Result.failure(e);
    } catch (e) {
      await clearAuthState();
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<UserEntity, AppError>> getCurrentUser() async {
    try {
      // 首先尝试从本地缓存获取用户信息
      final cachedUser = await _localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Result.success(_mapUserToEntity(cachedUser));
      }

      // 如果本地没有缓存，从远程获取
      final user = await _remoteDataSource.getCurrentUser();
      // 保存到本地缓存
      await _localDataSource.saveCachedUser(user);
      return Result.success(_mapUserToEntity(user));
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<PatientEntity?, AppError>> getPatient() async {
    try {
      final patient = await _remoteDataSource.getPatient();
      return Result.success(patient != null ? _mapPatientToEntity(patient) : null);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<PatientEntity, AppError>> signPatient(SignPatientRequest request) async {
    try {
      final dataRequest = _mapSignPatientRequestToData(request);
      final patient = await _remoteDataSource.signPatient(dataRequest);
      return Result.success(_mapPatientToEntity(patient));
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<bool, AppError>> hasSignedPatient() async {
    try {
      final patient = await _remoteDataSource.getPatient();
      return Result.success(patient != null);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _localDataSource.getAuthToken();
    final result = token != null && token.isNotEmpty;
    print('🔐 检查认证状态: token=${token != null ? '存在' : '不存在'}, isAuthenticated=$result');
    return result;
  }

  /// 私有方法：保存认证状态
  Future<void> saveAuthState(LoginResponse response) async {
    await Future.wait([
      _localDataSource.saveAuthToken(response.token),
      _localDataSource.saveCachedUser(response.user),
    ]);
  }

  @override
  Future<void> clearAuthState() async {
    await Future.wait([
      _localDataSource.removeAuthToken(),
      _localDataSource.removeCachedUser(),
    ]);
  }

  @override
  Future<bool> hasAgreedToTerms() async {
    return await _localDataSource.hasAgreedToTerms();
  }

  @override
  Future<void> saveTermsAgreement(bool agreed) async {
    await _localDataSource.saveTermsAgreement(agreed);
  }

  @override
  Future<UserEntity?> getCachedUser() async {
    final user = await _localDataSource.getCachedUser();
    return user != null ? _mapUserToEntity(user) : null;
  }

  @override
  Future<String?> getAuthToken() async {
    return await _localDataSource.getAuthToken();
  }
}
