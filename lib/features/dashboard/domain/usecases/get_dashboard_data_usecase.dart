import '../../../../core/errors/app_error.dart';
import '../entities/dashboard_entity.dart';
import '../repositories/dashboard_repository.dart';

/// 获取首页数据用例
abstract class GetDashboardDataUseCase {
  Future<Result<DashboardEntity, AppError>> execute(
    String patientId, {
    bool forceRefresh = false,
  });
}

/// 获取首页数据用例实现
class GetDashboardDataUseCaseImpl implements GetDashboardDataUseCase {
  final DashboardRepository _repository;

  const GetDashboardDataUseCaseImpl(this._repository);

  @override
  Future<Result<DashboardEntity, AppError>> execute(
    String patientId, {
    bool forceRefresh = false,
  }) async {
    try {
      return await _repository.getDashboardData(
        patientId,
        forceRefresh: forceRefresh,
      );
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}