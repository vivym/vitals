import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';

// 记录血压数据用例接口
abstract class RecordBloodPressureUseCase {
  Future<Result<BloodPressureRecord, AppError>> execute(
    String patientId,
    RecordHealthDataRequest request,
  );
}

// 记录血压数据用例实现
class RecordBloodPressureUseCaseImpl implements RecordBloodPressureUseCase {
  final HealthDataRepository _repository;

  RecordBloodPressureUseCaseImpl(this._repository);

  @override
  Future<Result<BloodPressureRecord, AppError>> execute(
    String patientId,
    RecordHealthDataRequest request,
  ) async {
    try {
      return await _repository.addBloodPressureRecord(patientId, request);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}