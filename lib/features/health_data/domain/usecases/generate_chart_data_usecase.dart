import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';

// 生成图表数据用例接口
abstract class GenerateChartDataUseCase {
  Future<Result<ChartData, AppError>> execute(
    String patientId,
    TimeRange range,
  );
}

// 生成图表数据用例实现
class GenerateChartDataUseCaseImpl implements GenerateChartDataUseCase {
  final HealthDataRepository _repository;

  GenerateChartDataUseCaseImpl(this._repository);

  @override
  Future<Result<ChartData, AppError>> execute(
    String patientId,
    TimeRange range,
  ) async {
    try {
      return await _repository.getBloodPressureChartData(patientId, range);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}