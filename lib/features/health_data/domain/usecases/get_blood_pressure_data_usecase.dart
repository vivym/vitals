import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';
import 'package:vitals/features/health_data/presentation/providers/health_data_providers.dart';

part 'get_blood_pressure_data_usecase.g.dart';

// 获取血压数据用例
@riverpod
class GetBloodPressureDataUseCase extends _$GetBloodPressureDataUseCase {
  @override
  Future<Result<List<BloodPressureRecord>, AppError>> build() async {
    throw UnimplementedError('Use execute method instead');
  }

  Future<Result<List<BloodPressureRecord>, AppError>> execute(
    String patientId, {
    TimeRange? range,
    bool forceRefresh = false,
  }) async {
    final repository = ref.read(healthDataRepositoryProvider);
    return repository.getBloodPressureRecords(
      patientId,
      range: range,
      forceRefresh: forceRefresh,
    );
  }
}
