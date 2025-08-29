// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodPressureState _$BloodPressureStateFromJson(Map<String, dynamic> json) =>
    _BloodPressureState(
      records:
          (json['records'] as List<dynamic>?)
              ?.map(
                (e) => BloodPressureRecord.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      selectedRange:
          $enumDecodeNullable(_$TimeRangeEnumMap, json['selectedRange']) ??
          TimeRange.month,
      chartData: json['chartData'] == null
          ? null
          : ChartData.fromJson(json['chartData'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      isRecording: json['isRecording'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$BloodPressureStateToJson(_BloodPressureState instance) =>
    <String, dynamic>{
      'records': instance.records,
      'selectedRange': _$TimeRangeEnumMap[instance.selectedRange]!,
      'chartData': instance.chartData,
      'isLoading': instance.isLoading,
      'isRecording': instance.isRecording,
      'error': instance.error,
    };

const _$TimeRangeEnumMap = {
  TimeRange.week: 'week',
  TimeRange.month: 'month',
  TimeRange.threeMonths: 'threeMonths',
  TimeRange.year: 'year',
  TimeRange.all: 'all',
};
