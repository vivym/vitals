import '../../../../core/errors/app_error.dart';
import '../repositories/dashboard_repository.dart';

/// 切换教育内容收藏状态用例
abstract class ToggleEducationFavoriteUseCase {
  Future<Result<void, AppError>> execute(String itemId, bool isFavorited);
}

/// 切换教育内容收藏状态用例实现
class ToggleEducationFavoriteUseCaseImpl implements ToggleEducationFavoriteUseCase {
  final DashboardRepository _repository;

  const ToggleEducationFavoriteUseCaseImpl(this._repository);

  @override
  Future<Result<void, AppError>> execute(String itemId, bool isFavorited) async {
    if (itemId.isEmpty) {
      return Result.failure(
        AppError.validation(field: 'itemId', message: '教育内容ID不能为空'),
      );
    }

    try {
      return await _repository.toggleEducationFavorite(itemId, isFavorited);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}
