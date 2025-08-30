import '../../../../core/errors/app_error.dart';
import '../repositories/dashboard_repository.dart';

/// 标记教育内容为已读用例
abstract class MarkEducationAsReadUseCase {
  Future<Result<void, AppError>> execute(String itemId);
}

/// 标记教育内容为已读用例实现
class MarkEducationAsReadUseCaseImpl implements MarkEducationAsReadUseCase {
  final DashboardRepository _repository;

  const MarkEducationAsReadUseCaseImpl(this._repository);

  @override
  Future<Result<void, AppError>> execute(String itemId) async {
    if (itemId.isEmpty) {
      return Result.failure(
        AppError.validation(field: 'itemId', message: '教育内容ID不能为空'),
      );
    }

    try {
      return await _repository.markEducationAsRead(itemId);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}