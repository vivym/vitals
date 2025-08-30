import '../../../../core/errors/app_error.dart';
import '../entities/dashboard_entity.dart';
import '../repositories/dashboard_repository.dart';

/// 计算健康评分用例
abstract class CalculateHealthScoreUseCase {
  Future<Result<HealthScoreEntity, AppError>> execute(String patientId);
}

/// 计算健康评分用例实现
class CalculateHealthScoreUseCaseImpl implements CalculateHealthScoreUseCase {
  final DashboardRepository _repository;

  const CalculateHealthScoreUseCaseImpl(this._repository);

  @override
  Future<Result<HealthScoreEntity, AppError>> execute(String patientId) async {
    if (patientId.isEmpty) {
      return Result.failure(
        AppError.validation(field: 'patientId', message: '患者ID不能为空'),
      );
    }

    try {
      return await _repository.calculateHealthScore(patientId);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}