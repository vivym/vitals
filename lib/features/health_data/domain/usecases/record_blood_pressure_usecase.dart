import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';
import 'package:vitals/features/health_data/presentation/providers/health_data_providers.dart';

part 'record_blood_pressure_usecase.g.dart';

// 记录血压数据用例
@riverpod
class RecordBloodPressureUseCase extends _$RecordBloodPressureUseCase {
  @override
  Future<Result<BloodPressureRecord, AppError>> build() async {
    throw UnimplementedError('Use execute method instead');
  }

  Future<Result<BloodPressureRecord, AppError>> execute(
    String patientId,
    int systolic,
    int diastolic, {
    int? heartRate,
    DateTime? recordedAt,
    String? notes,
  }) async {
    // 业务验证
    final validationResult = _validateBloodPressureData(systolic, diastolic);
    if (validationResult.isFailure) {
      return validationResult.cast<BloodPressureRecord>();
    }

    final request = RecordHealthDataRequest.bloodPressure(
      systolic: systolic,
      diastolic: diastolic,
      heartRate: heartRate,
      recordedAt: recordedAt ?? DateTime.now(),
      notes: notes,
    );

    final repository = ref.read(healthDataRepositoryProvider);
    return repository.addBloodPressureRecord(patientId, request);
  }

  Result<void, AppError> _validateBloodPressureData(int systolic, int diastolic) {
    if (systolic <= 0 || systolic > 300) {
      return const Result.failure(
        AppError.validation(field: 'systolic', message: '收缩压范围无效'),
      );
    }

    if (diastolic <= 0 || diastolic > 200) {
      return const Result.failure(
        AppError.validation(field: 'diastolic', message: '舒张压范围无效'),
      );
    }

    if (systolic <= diastolic) {
      return const Result.failure(
        AppError.validation(field: 'pressure', message: '收缩压应大于舒张压'),
      );
    }

    return const Result.success(null);
  }
}
