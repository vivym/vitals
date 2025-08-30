import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';

// 获取血压数据用例接口
abstract class GetBloodPressureDataUseCase {
  Future<Result<List<BloodPressureRecord>, AppError>> execute(
    String patientId, {
    TimeRange? range,
    bool forceRefresh = false,
  });
}

// 获取血压数据用例实现
class GetBloodPressureDataUseCaseImpl implements GetBloodPressureDataUseCase {
  final HealthDataRepository _repository;

  GetBloodPressureDataUseCaseImpl(this._repository);

  @override
  Future<Result<List<BloodPressureRecord>, AppError>> execute(
    String patientId, {
    TimeRange? range,
    bool forceRefresh = false,
  }) async {
    try {
      return await _repository.getBloodPressureRecords(
        patientId,
        range: range,
        forceRefresh: forceRefresh,
      );
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}