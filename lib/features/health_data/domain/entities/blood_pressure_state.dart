import 'package:freezed_annotation/freezed_annotation.dart';
import 'blood_pressure_record.dart';
import 'chart_data.dart';
import 'time_range.dart';

part 'blood_pressure_state.freezed.dart';
part 'blood_pressure_state.g.dart';

// 血压模块状态
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

  factory BloodPressureState.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureStateFromJson(json);

  const BloodPressureState._();

  List<BloodPressureRecord> get filteredRecords {
    if (selectedRange == TimeRange.all) return records;

    final cutoffDate = DateTime.now().subtract(Duration(days: selectedRange.days));
    return records.where((record) => record.recordedAt.isAfter(cutoffDate)).toList();
  }

  BloodPressureRecord? get latestRecord =>
      records.isNotEmpty ? records.first : null;
}
