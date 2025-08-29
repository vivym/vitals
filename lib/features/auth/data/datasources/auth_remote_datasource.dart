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

  /// 获取用户的患者列表
  Future<List<Patient>> getPatients();

  /// 创建新患者
  Future<Patient> createPatient(CreatePatientRequest request);
}
