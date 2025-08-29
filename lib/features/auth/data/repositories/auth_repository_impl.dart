import 'package:vitals/core/errors/app_error.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/auth_models.dart';
import '../models/patient.dart';
import '../models/user.dart';
import 'auth_repository.dart';

/// 认证仓库实现
/// 协调远程和本地数据源，提供统一的数据访问接口
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<LoginResponse, AppError>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      await saveAuthState(response);
      return Result.success(response);
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
  Future<Result<User, AppError>> getCurrentUser() async {
    try {
      // 首先尝试从本地缓存获取用户信息
      final cachedUser = await _localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Result.success(cachedUser);
      }

      // 如果本地没有缓存，从远程获取
      final user = await _remoteDataSource.getCurrentUser();
      // 保存到本地缓存
      await _localDataSource.saveCachedUser(user);
      return Result.success(user);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<List<Patient>, AppError>> getPatients() async {
    try {
      final patients = await _remoteDataSource.getPatients();
      return Result.success(patients);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<Patient, AppError>> createPatient(CreatePatientRequest request) async {
    try {
      final patient = await _remoteDataSource.createPatient(request);
      return Result.success(patient);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _localDataSource.getAuthToken();
    return token != null && token.isNotEmpty;
  }

  @override
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
  Future<User?> getCachedUser() async {
    return await _localDataSource.getCachedUser();
  }

  @override
  Future<String?> getAuthToken() async {
    return await _localDataSource.getAuthToken();
  }
}
