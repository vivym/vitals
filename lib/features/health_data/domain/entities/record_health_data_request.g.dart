// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_health_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodPressureRequest _$BloodPressureRequestFromJson(
  Map<String, dynamic> json,
) => _BloodPressureRequest(
  systolic: (json['systolic'] as num).toInt(),
  diastolic: (json['diastolic'] as num).toInt(),
  heartRate: (json['heartRate'] as num?)?.toInt(),
  recordedAt: json['recordedAt'] == null
      ? null
      : DateTime.parse(json['recordedAt'] as String),
  notes: json['notes'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$BloodPressureRequestToJson(
  _BloodPressureRequest instance,
) => <String, dynamic>{
  'systolic': instance.systolic,
  'diastolic': instance.diastolic,
  'heartRate': instance.heartRate,
  'recordedAt': instance.recordedAt?.toIso8601String(),
  'notes': instance.notes,
  'runtimeType': instance.$type,
};

_HeartRateRequest _$HeartRateRequestFromJson(Map<String, dynamic> json) =>
    _HeartRateRequest(
      bpm: (json['bpm'] as num).toInt(),
      recordedAt: json['recordedAt'] == null
          ? null
          : DateTime.parse(json['recordedAt'] as String),
      notes: json['notes'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$HeartRateRequestToJson(_HeartRateRequest instance) =>
    <String, dynamic>{
      'bpm': instance.bpm,
      'recordedAt': instance.recordedAt?.toIso8601String(),
      'notes': instance.notes,
      'runtimeType': instance.$type,
    };

_WeightRequest _$WeightRequestFromJson(Map<String, dynamic> json) =>
    _WeightRequest(
      weight: (json['weight'] as num).toDouble(),
      recordedAt: json['recordedAt'] == null
          ? null
          : DateTime.parse(json['recordedAt'] as String),
      notes: json['notes'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$WeightRequestToJson(_WeightRequest instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'recordedAt': instance.recordedAt?.toIso8601String(),
      'notes': instance.notes,
      'runtimeType': instance.$type,
    };
