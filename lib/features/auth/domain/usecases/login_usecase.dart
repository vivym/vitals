import 'package:vitals/core/errors/app_error.dart';
import '../repositories/auth_repository.dart';

/// 登录用例
/// 包含登录业务逻辑和验证规则
abstract class LoginUseCase {
  /// 执行登录
  ///
  /// [phone] 手机号
  /// [agreedToTerms] 是否同意协议
  Future<Result<LoginResult, AppError>> execute(
    String phone, {
    bool agreedToTerms = false,
  });
}
