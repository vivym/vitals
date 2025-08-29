// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataEntryState _$DataEntryStateFromJson(Map<String, dynamic> json) =>
    _DataEntryState(
      systolic: (json['systolic'] as num?)?.toInt(),
      diastolic: (json['diastolic'] as num?)?.toInt(),
      heartRate: (json['heartRate'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      recordedAt: json['recordedAt'] == null
          ? null
          : DateTime.parse(json['recordedAt'] as String),
      notes: json['notes'] as String?,
      validationErrors:
          (json['validationErrors'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      isSubmitting: json['isSubmitting'] as bool? ?? false,
    );

Map<String, dynamic> _$DataEntryStateToJson(_DataEntryState instance) =>
    <String, dynamic>{
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'heartRate': instance.heartRate,
      'weight': instance.weight,
      'recordedAt': instance.recordedAt?.toIso8601String(),
      'notes': instance.notes,
      'validationErrors': instance.validationErrors,
      'isSubmitting': instance.isSubmitting,
    };
