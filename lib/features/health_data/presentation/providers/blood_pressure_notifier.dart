import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_state.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
import 'package:vitals/features/health_data/domain/usecases/generate_chart_data_usecase.dart';
import 'package:vitals/features/health_data/domain/usecases/get_blood_pressure_data_usecase.dart';
import 'package:vitals/features/health_data/domain/usecases/record_blood_pressure_usecase.dart';

part 'blood_pressure_notifier.g.dart';

// 血压页面状态管理
@riverpod
class BloodPressureNotifier extends _$BloodPressureNotifier {
  @override
  AsyncValue<BloodPressureState> build() {
    _loadBloodPressureData();
    return const AsyncValue.loading();
  }

  Future<void> refresh() async {
    await _loadBloodPressureData(forceRefresh: true);
  }

  void changeTimeRange(TimeRange range) {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(selectedRange: range));
      _updateChartData();
    });
  }

  Future<void> addRecord(int systolic, int diastolic, {int? heartRate}) async {
    const patientId = 'patient_1'; // 临时使用固定ID

    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(isRecording: true));
    });

    final useCase = ref.read(recordBloodPressureUseCaseProvider.notifier);
    final result = await useCase.execute(
      patientId,
      systolic,
      diastolic,
      heartRate: heartRate,
    );

    result.when(
      success: (record) {
        state.whenData((currentState) {
          final updatedRecords = <BloodPressureRecord>[record, ...currentState.records];
          state = AsyncValue.data(currentState.copyWith(
            records: updatedRecords,
            isRecording: false,
          ));
          _updateChartData();
        });
      },
      failure: (error) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            isRecording: false,
            error: error.toString(),
          ));
        });
      },
    );
  }

  Future<void> _loadBloodPressureData({bool forceRefresh = false}) async {
    const patientId = 'patient_1'; // 临时使用固定ID
    final useCase = ref.read(getBloodPressureDataUseCaseProvider.notifier);

    final result = await useCase.execute(
      patientId,
      forceRefresh: forceRefresh,
    );

    result.when(
      success: (records) {
        state = AsyncValue.data(BloodPressureState(records: records));
        _updateChartData();
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  void _updateChartData() {
    state.whenData((currentState) {
      final chartUseCase = ref.read(generateChartDataUseCaseProvider.notifier);
      final chartData = chartUseCase.execute(
        currentState.filteredRecords,
        currentState.selectedRange,
      );

      state = AsyncValue.data(currentState.copyWith(chartData: chartData));
    });
  }
}
