import '../models/user.dart';

/// 认证本地数据源接口
abstract class AuthLocalDataSource {
  /// 获取认证token
  Future<String?> getAuthToken();

  /// 保存认证token
  Future<void> saveAuthToken(String token);

  /// 删除认证token
  Future<void> removeAuthToken();

  /// 获取缓存的用户信息
  Future<User?> getCachedUser();

  /// 保存用户信息到缓存
  Future<void> saveCachedUser(User user);

  /// 删除缓存的用户信息
  Future<void> removeCachedUser();

  /// 检查是否已同意协议
  Future<bool> hasAgreedToTerms();

  /// 保存协议同意状态
  Future<void> saveTermsAgreement(bool agreed);
}
