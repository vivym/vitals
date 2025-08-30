import 'package:freezed_annotation/freezed_annotation.dart';
import 'chart_models.dart';

part 'health_data_states.freezed.dart';

// =============================================================================
// 时间范围枚举 (Presentation层)
// =============================================================================

enum TimeRange {
  week('近一周'),
  month('近一月'),
  all('全部');

  const TimeRange(this.label);
  final String label;
}

// =============================================================================
// 血压模块状态
// =============================================================================

@freezed
abstract class BloodPressureState with _$BloodPressureState {
  const factory BloodPressureState({
    @Default([]) List<BloodPressureRecord> records,
    @Default(TimeRange.month) TimeRange selectedRange,
    ChartData? chartData,
    @Default(false) bool isLoading,
    @Default(false) bool isRecording,
    String? error,
  }) = _BloodPressureState;

  const BloodPressureState._();

  List<BloodPressureRecord> get filteredRecords {
    if (selectedRange == TimeRange.all) return records;

    final cutoffDate = DateTime.now().subtract(Duration(days: _getDaysForRange(selectedRange)));
    return records.where((record) => record.recordedAt.isAfter(cutoffDate)).toList();
  }

  BloodPressureRecord? get latestRecord =>
      records.isNotEmpty ? records.first : null;

  int _getDaysForRange(TimeRange range) {
    switch (range) {
      case TimeRange.week:
        return 7;
      case TimeRange.month:
        return 30;
      case TimeRange.all:
        return 36500; // 100 years
    }
  }
}

// =============================================================================
// 数据录入状态
// =============================================================================

@freezed
abstract class DataEntryState with _$DataEntryState {
  const factory DataEntryState({
    int? systolic,
    int? diastolic,
    int? heartRate,
    double? weight,
    DateTime? recordedAt,
    String? notes,
    @Default({}) Map<String, String> validationErrors,
    @Default(false) bool isSubmitting,
  }) = _DataEntryState;

  const DataEntryState._();

  bool get isValid => validationErrors.isEmpty;
  bool get hasBloodPressureData => systolic != null && diastolic != null;
  bool get hasHeartRateData => heartRate != null;
  bool get hasWeightData => weight != null;
}
