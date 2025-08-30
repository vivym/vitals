import 'package:vitals/core/errors/app_error.dart';
import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';
import 'login_usecase.dart';

/// 登录用例实现
/// 包含登录业务逻辑和验证规则
class LoginUseCaseImpl implements LoginUseCase {
  final AuthRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<Result<LoginResult, AppError>> execute(
    String phone, {
    bool agreedToTerms = false,
  }) async {
    // 业务规则验证
    if (!agreedToTerms) {
      return const Result.failure(
        AppError.validation(
          field: 'terms',
          message: '请先同意服务协议和隐私协议',
        ),
      );
    }

    if (!UserEntity.isValidPhone(phone)) {
      return const Result.failure(
        AppError.validation(
          field: 'phone',
          message: '请输入正确的手机号码',
        ),
      );
    }

    return await _repository.login(phone, agreedToTerms: agreedToTerms);
  }

}
