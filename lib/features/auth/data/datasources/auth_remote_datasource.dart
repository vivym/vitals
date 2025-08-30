import '../models/auth_models.dart';
import '../models/patient.dart';
import '../models/user.dart';

/// 认证远程数据源接口
abstract class AuthRemoteDataSource {
  /// 用户登录
  Future<LoginResponse> login(LoginRequest request);

  /// 用户登出
  Future<void> logout();

  /// 获取当前用户信息
  Future<User> getCurrentUser();

  /// 获取用户签约的患者信息（单个）
  Future<Patient?> getPatient();

  /// 患者签约
  Future<Patient> signPatient(SignPatientRequest request);
}
