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
    print('🔍 自动登录用例：开始执行');

    final isAuthenticated = await _repository.isAuthenticated();
    print('🔍 自动登录用例：认证检查结果 = $isAuthenticated');

    if (!isAuthenticated) {
      print('❌ 自动登录用例：未找到有效登录凭证');
      return const Result.failure(
        AppError.authentication(message: '未找到有效的登录凭证'),
      );
    }

    print('✅ 自动登录用例：发现有效凭证，获取用户信息');
    final result = await _repository.getCurrentUser();

    result.when(
      success: (user) => print('✅ 自动登录用例：成功获取用户 ${user.name}'),
      failure: (error) => print('❌ 自动登录用例：获取用户失败 ${error.message}'),
    );

    return result;
  }
}
