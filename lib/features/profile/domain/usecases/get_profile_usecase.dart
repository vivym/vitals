import '../../../../core/errors/app_error.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// 获取个人资料用例


class GetProfileUsecase {
  final ProfileRepository _repository;

  GetProfileUsecase(this._repository);

  /// 执行获取个人资料
  Future<Result<ProfileEntity, AppError>> call(String userId) async {
    try {
      return await _repository.getProfile(userId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '获取个人资料失败: ${e.toString()}'),
      );
    }
  }
}


