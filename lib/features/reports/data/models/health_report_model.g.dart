// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthReportModel _$HealthReportModelFromJson(Map<String, dynamic> json) =>
    _HealthReportModel(
      id: json['id'] as String,
      patientId: json['patient_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: (json['type'] as num).toInt(),
      reportUrl: json['report_url'] as String,
      status: (json['status'] as num).toInt(),
      generatedAt: json['generated_at'] == null
          ? null
          : DateTime.parse(json['generated_at'] as String),
      periodStart: json['period_start'] == null
          ? null
          : DateTime.parse(json['period_start'] as String),
      periodEnd: json['period_end'] == null
          ? null
          : DateTime.parse(json['period_end'] as String),
      thumbnailUrl: json['thumbnail_url'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      isShared: json['is_shared'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$HealthReportModelToJson(_HealthReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_id': instance.patientId,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'report_url': instance.reportUrl,
      'status': instance.status,
      'generated_at': instance.generatedAt?.toIso8601String(),
      'period_start': instance.periodStart?.toIso8601String(),
      'period_end': instance.periodEnd?.toIso8601String(),
      'thumbnail_url': instance.thumbnailUrl,
      'is_read': instance.isRead,
      'is_shared': instance.isShared,
      'created_at': instance.createdAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

_ReportShareRecordModel _$ReportShareRecordModelFromJson(
  Map<String, dynamic> json,
) => _ReportShareRecordModel(
  id: json['id'] as String,
  reportId: json['report_id'] as String,
  method: (json['method'] as num).toInt(),
  recipientInfo: json['recipient_info'] as String?,
  sharedAt: DateTime.parse(json['shared_at'] as String),
  message: json['message'] as String?,
);

Map<String, dynamic> _$ReportShareRecordModelToJson(
  _ReportShareRecordModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'report_id': instance.reportId,
  'method': instance.method,
  'recipient_info': instance.recipientInfo,
  'shared_at': instance.sharedAt.toIso8601String(),
  'message': instance.message,
};
