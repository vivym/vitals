import '../../../../core/errors/app_error.dart';
import '../entities/health_education_entity.dart';
import '../repositories/dashboard_repository.dart';

/// 获取健康教育内容列表用例
abstract class GetEducationItemsUseCase {
  Future<Result<List<HealthEducationItemEntity>, AppError>> execute({
    int page = 1,
    int limit = 10,
    String? category,
    List<String>? tags,
  });
}

/// 获取健康教育内容列表用例实现
class GetEducationItemsUseCaseImpl implements GetEducationItemsUseCase {
  final DashboardRepository _repository;

  const GetEducationItemsUseCaseImpl(this._repository);

  @override
  Future<Result<List<HealthEducationItemEntity>, AppError>> execute({
    int page = 1,
    int limit = 10,
    String? category,
    List<String>? tags,
  }) async {
    if (page < 1) {
      return Result.failure(
        AppError.validation(field: 'page', message: '页码必须大于0'),
      );
    }

    if (limit < 1 || limit > 100) {
      return Result.failure(
        AppError.validation(field: 'limit', message: '每页数量必须在1-100之间'),
      );
    }

    try {
      return await _repository.getEducationItems(
        page: page,
        limit: limit,
        category: category,
        tags: tags,
      );
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}
