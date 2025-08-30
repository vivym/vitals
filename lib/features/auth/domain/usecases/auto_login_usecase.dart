import 'package:vitals/core/errors/app_error.dart';
import '../entities/user_entity.dart';

/// 自动登录用例
/// 检查本地存储的认证信息并尝试自动登录
abstract class AutoLoginUseCase {
  /// 执行自动登录
  ///
  /// 检查本地token有效性，获取用户信息
  Future<Result<UserEntity, AppError>> execute();
}
