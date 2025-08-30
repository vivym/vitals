import 'package:vitals/core/errors/app_error.dart';
import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';
import 'auto_login_usecase.dart';

/// 自动登录用例实现
/// 检查本地存储的认证信息并尝试自动登录
class AutoLoginUseCaseImpl implements AutoLoginUseCase {
  final AuthRepository _repository;

  AutoLoginUseCaseImpl(this._repository);

  @override
  Future<Result<UserEntity, AppError>> execute() async {
    final isAuthenticated = await _repository.isAuthenticated();
    if (!isAuthenticated) {
      return const Result.failure(
        AppError.authentication(message: '未找到有效的登录凭证'),
      );
    }

    return await _repository.getCurrentUser();
  }
}
