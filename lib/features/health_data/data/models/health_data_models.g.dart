// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodPressureRecordModel _$BloodPressureRecordModelFromJson(
  Map<String, dynamic> json,
) => _BloodPressureRecordModel(
  id: json['id'] as String,
  patientId: json['patient_id'] as String,
  systolic: (json['systolic'] as num).toInt(),
  diastolic: (json['diastolic'] as num).toInt(),
  recordedAt: DateTime.parse(json['recorded_at'] as String),
  heartRate: (json['heart_rate'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  level: $enumDecodeNullable(_$BloodPressureLevelModelEnumMap, json['level']),
  source: $enumDecodeNullable(_$MeasurementSourceModelEnumMap, json['source']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$BloodPressureRecordModelToJson(
  _BloodPressureRecordModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'patient_id': instance.patientId,
  'systolic': instance.systolic,
  'diastolic': instance.diastolic,
  'recorded_at': instance.recordedAt.toIso8601String(),
  'heart_rate': instance.heartRate,
  'notes': instance.notes,
  'level': _$BloodPressureLevelModelEnumMap[instance.level],
  'source': _$MeasurementSourceModelEnumMap[instance.source],
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$BloodPressureLevelModelEnumMap = {
  BloodPressureLevelModel.normal: 'normal',
  BloodPressureLevelModel.elevated: 'elevated',
  BloodPressureLevelModel.stage1: 'stage1',
  BloodPressureLevelModel.stage2: 'stage2',
  BloodPressureLevelModel.crisis: 'crisis',
};

const _$MeasurementSourceModelEnumMap = {
  MeasurementSourceModel.manual: 'manual',
  MeasurementSourceModel.device: 'device',
  MeasurementSourceModel.import: 'import',
};

_DataPointModel _$DataPointModelFromJson(Map<String, dynamic> json) =>
    _DataPointModel(
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: (json['value'] as num).toDouble(),
      secondaryValue: (json['secondary_value'] as num?)?.toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DataPointModelToJson(_DataPointModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
      'secondary_value': instance.secondaryValue,
      'metadata': instance.metadata,
    };

_ChartDataModel _$ChartDataModelFromJson(Map<String, dynamic> json) =>
    _ChartDataModel(
      dataPoints: (json['data_points'] as List<dynamic>)
          .map((e) => DataPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeRange: $enumDecode(_$TimeRangeModelEnumMap, json['time_range']),
      minValue: (json['min_value'] as num?)?.toDouble(),
      maxValue: (json['max_value'] as num?)?.toDouble(),
      averageValue: (json['average_value'] as num?)?.toDouble(),
      trend: json['trend'] as String?,
    );

Map<String, dynamic> _$ChartDataModelToJson(_ChartDataModel instance) =>
    <String, dynamic>{
      'data_points': instance.dataPoints,
      'time_range': _$TimeRangeModelEnumMap[instance.timeRange]!,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'average_value': instance.averageValue,
      'trend': instance.trend,
    };

const _$TimeRangeModelEnumMap = {
  TimeRangeModel.week: 'week',
  TimeRangeModel.month: 'month',
  TimeRangeModel.all: 'all',
};

_RecordHealthDataRequestModel _$RecordHealthDataRequestModelFromJson(
  Map<String, dynamic> json,
) => _RecordHealthDataRequestModel(
  systolic: (json['systolic'] as num?)?.toInt(),
  diastolic: (json['diastolic'] as num?)?.toInt(),
  heartRate: (json['heart_rate'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  recordedAt: json['recorded_at'] == null
      ? null
      : DateTime.parse(json['recorded_at'] as String),
  notes: json['notes'] as String?,
  source: $enumDecodeNullable(_$MeasurementSourceModelEnumMap, json['source']),
);

Map<String, dynamic> _$RecordHealthDataRequestModelToJson(
  _RecordHealthDataRequestModel instance,
) => <String, dynamic>{
  'systolic': instance.systolic,
  'diastolic': instance.diastolic,
  'heart_rate': instance.heartRate,
  'weight': instance.weight,
  'recorded_at': instance.recordedAt?.toIso8601String(),
  'notes': instance.notes,
  'source': _$MeasurementSourceModelEnumMap[instance.source],
};

_BloodPressureDataResponse _$BloodPressureDataResponseFromJson(
  Map<String, dynamic> json,
) => _BloodPressureDataResponse(
  records: (json['records'] as List<dynamic>)
      .map((e) => BloodPressureRecordModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  chartData: json['chart_data'] == null
      ? null
      : ChartDataModel.fromJson(json['chart_data'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$BloodPressureDataResponseToJson(
  _BloodPressureDataResponse instance,
) => <String, dynamic>{
  'records': instance.records,
  'chart_data': instance.chartData,
  'metadata': instance.metadata,
};
