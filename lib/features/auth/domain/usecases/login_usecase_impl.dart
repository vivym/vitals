import 'package:vitals/core/errors/app_error.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/auth_models.dart';
import 'login_usecase.dart';

/// 登录用例实现
/// 包含登录业务逻辑和验证规则
class LoginUseCaseImpl implements LoginUseCase {
  final AuthRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<Result<LoginResponse, AppError>> execute(
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

    if (!_isValidPhone(phone)) {
      return const Result.failure(
        AppError.validation(
          field: 'phone',
          message: '请输入正确的手机号码',
        ),
      );
    }

    final request = LoginRequest(phone: phone, agreedToTerms: agreedToTerms);
    return await _repository.login(request);
  }

  bool _isValidPhone(String phone) {
    final regex = RegExp(r'^1[3-9]\d{9}$');
    return regex.hasMatch(phone);
  }
}
