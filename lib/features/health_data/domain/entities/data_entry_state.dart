import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_entry_state.freezed.dart';
part 'data_entry_state.g.dart';

// 数据录入状态
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

  factory DataEntryState.fromJson(Map<String, dynamic> json) =>
      _$DataEntryStateFromJson(json);

  const DataEntryState._();

  bool get isValid => validationErrors.isEmpty;
  bool get hasBloodPressureData => systolic != null && diastolic != null;
  bool get hasHeartRateData => heartRate != null;
  bool get hasWeightData => weight != null;
}
