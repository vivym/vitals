import 'package:vitals/core/errors/app_error.dart';
import '../models/auth_models.dart';
import '../models/patient.dart';
import '../models/user.dart';

/// 认证仓库接口
/// 协调远程和本地数据源，提供统一的数据访问接口
abstract class AuthRepository {
  /// 用户登录
  Future<Result<LoginResponse, AppError>> login(LoginRequest request);

  /// 用户登出
  Future<Result<void, AppError>> logout();

  /// 获取当前用户信息
  Future<Result<User, AppError>> getCurrentUser();

  /// 获取用户的患者列表
  Future<Result<List<Patient>, AppError>> getPatients();

  /// 创建新患者
  Future<Result<Patient, AppError>> createPatient(CreatePatientRequest request);

  /// 检查是否已认证
  Future<bool> isAuthenticated();

  /// 保存认证状态
  Future<void> saveAuthState(LoginResponse response);

  /// 清除认证状态
  Future<void> clearAuthState();

  /// 检查是否已同意协议
  Future<bool> hasAgreedToTerms();

  /// 保存协议同意状态
  Future<void> saveTermsAgreement(bool agreed);

  /// 获取缓存的用户信息
  Future<User?> getCachedUser();

  /// 获取存储的认证token
  Future<String?> getAuthToken();
}
