// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChartData _$ChartDataFromJson(Map<String, dynamic> json) => _ChartData(
  dataPoints: (json['dataPoints'] as List<dynamic>)
      .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
  timeRange: $enumDecode(_$TimeRangeEnumMap, json['timeRange']),
  minValue: (json['minValue'] as num?)?.toDouble(),
  maxValue: (json['maxValue'] as num?)?.toDouble(),
  averageValue: (json['averageValue'] as num?)?.toDouble(),
  trend: json['trend'] as String?,
);

Map<String, dynamic> _$ChartDataToJson(_ChartData instance) =>
    <String, dynamic>{
      'dataPoints': instance.dataPoints,
      'timeRange': _$TimeRangeEnumMap[instance.timeRange]!,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'averageValue': instance.averageValue,
      'trend': instance.trend,
    };

const _$TimeRangeEnumMap = {
  TimeRange.week: 'week',
  TimeRange.month: 'month',
  TimeRange.threeMonths: 'threeMonths',
  TimeRange.year: 'year',
  TimeRange.all: 'all',
};

_DataPoint _$DataPointFromJson(Map<String, dynamic> json) => _DataPoint(
  timestamp: DateTime.parse(json['timestamp'] as String),
  value: (json['value'] as num).toDouble(),
  secondaryValue: (json['secondaryValue'] as num?)?.toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$DataPointToJson(_DataPoint instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
      'secondaryValue': instance.secondaryValue,
      'metadata': instance.metadata,
    };
