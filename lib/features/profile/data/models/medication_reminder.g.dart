// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedicationReminder _$MedicationReminderFromJson(Map<String, dynamic> json) =>
    _MedicationReminder(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      medicationName: json['medicationName'] as String,
      dosage: json['dosage'] as String,
      scheduledTimes: _timeOfDayListFromJson(json['scheduledTimes'] as List),
      weekdays: (json['weekdays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
      notes: json['notes'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MedicationReminderToJson(_MedicationReminder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'medicationName': instance.medicationName,
      'dosage': instance.dosage,
      'scheduledTimes': _timeOfDayListToJson(instance.scheduledTimes),
      'weekdays': instance.weekdays,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isActive': instance.isActive,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
    };
