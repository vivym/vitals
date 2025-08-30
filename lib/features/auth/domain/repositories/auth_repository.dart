import 'package:vitals/core/errors/app_error.dart';
import '../entities/user_entity.dart';
import '../entities/patient_entity.dart';

/// 认证仓库接口
/// 定义认证领域的业务需求，不依赖任何外部技术实现
abstract class AuthRepository {
  /// 用户登录
  /// [phone] 手机号
  /// [agreedToTerms] 是否同意协议
  Future<Result<LoginResult, AppError>> login(String phone, {bool agreedToTerms = false});

  /// 用户登出
  Future<Result<void, AppError>> logout();

  /// 获取当前用户信息
  Future<Result<UserEntity, AppError>> getCurrentUser();

  /// 获取用户签约的患者信息（唯一患者）
  Future<Result<PatientEntity?, AppError>> getPatient();

  /// 签约患者（每个用户只能签约一个患者）
  Future<Result<PatientEntity, AppError>> signPatient(SignPatientRequest request);

  /// 检查用户是否已完成患者签约
  Future<Result<bool, AppError>> hasSignedPatient();

  /// 检查是否已认证
  Future<bool> isAuthenticated();

  /// 清除认证状态
  Future<void> clearAuthState();

  /// 检查是否已同意协议
  Future<bool> hasAgreedToTerms();

  /// 保存协议同意状态
  Future<void> saveTermsAgreement(bool agreed);

  /// 获取缓存的用户信息
  Future<UserEntity?> getCachedUser();

  /// 获取存储的认证token
  Future<String?> getAuthToken();
}

/// 登录结果 - 领域值对象
class LoginResult {
  final UserEntity user;
  final String token;
  final PatientEntity? patient;  // 改为单个患者，可为空

  const LoginResult({
    required this.user,
    required this.token,
    this.patient,
  });
}

/// 患者签约请求 - 领域值对象
class SignPatientRequest {
  final String name;
  final String idNumber;
  final Gender gender;
  final DateTime birthDate;
  final String phone;
  final String? medicalRecordNumber;
  final String? emergencyContact;
  final String? emergencyContactPhone;

  const SignPatientRequest({
    required this.name,
    required this.idNumber,
    required this.gender,
    required this.birthDate,
    required this.phone,
    this.medicalRecordNumber,
    this.emergencyContact,
    this.emergencyContactPhone,
  });
}
