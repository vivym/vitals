// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodPressureRecord _$BloodPressureRecordFromJson(Map<String, dynamic> json) =>
    _BloodPressureRecord(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      systolic: (json['systolic'] as num).toInt(),
      diastolic: (json['diastolic'] as num).toInt(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      heartRate: (json['heartRate'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      level: $enumDecodeNullable(_$BloodPressureLevelEnumMap, json['level']),
      source: $enumDecodeNullable(_$MeasurementSourceEnumMap, json['source']),
    );

Map<String, dynamic> _$BloodPressureRecordToJson(
  _BloodPressureRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'patientId': instance.patientId,
  'systolic': instance.systolic,
  'diastolic': instance.diastolic,
  'recordedAt': instance.recordedAt.toIso8601String(),
  'heartRate': instance.heartRate,
  'notes': instance.notes,
  'level': _$BloodPressureLevelEnumMap[instance.level],
  'source': _$MeasurementSourceEnumMap[instance.source],
};

const _$BloodPressureLevelEnumMap = {
  BloodPressureLevel.normal: 'normal',
  BloodPressureLevel.elevated: 'elevated',
  BloodPressureLevel.stage1: 'stage1',
  BloodPressureLevel.stage2: 'stage2',
  BloodPressureLevel.crisis: 'crisis',
};

const _$MeasurementSourceEnumMap = {
  MeasurementSource.manual: 'manual',
  MeasurementSource.device: 'device',
  MeasurementSource.import: 'import',
};
