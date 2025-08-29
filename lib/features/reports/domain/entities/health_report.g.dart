// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthReport _$HealthReportFromJson(Map<String, dynamic> json) =>
    _HealthReport(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ReportTypeEnumMap, json['type']),
      reportUrl: json['reportUrl'] as String,
      status: $enumDecode(_$ReportStatusEnumMap, json['status']),
      generatedAt: json['generated_at'] == null
          ? null
          : DateTime.parse(json['generated_at'] as String),
      periodStart: json['period_start'] == null
          ? null
          : DateTime.parse(json['period_start'] as String),
      periodEnd: json['period_end'] == null
          ? null
          : DateTime.parse(json['period_end'] as String),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      isRead: json['isRead'] as bool? ?? false,
      isShared: json['isShared'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$HealthReportToJson(_HealthReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'title': instance.title,
      'description': instance.description,
      'type': _$ReportTypeEnumMap[instance.type]!,
      'reportUrl': instance.reportUrl,
      'status': _$ReportStatusEnumMap[instance.status]!,
      'generated_at': instance.generatedAt?.toIso8601String(),
      'period_start': instance.periodStart?.toIso8601String(),
      'period_end': instance.periodEnd?.toIso8601String(),
      'thumbnailUrl': instance.thumbnailUrl,
      'isRead': instance.isRead,
      'isShared': instance.isShared,
      'created_at': instance.createdAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$ReportTypeEnumMap = {
  ReportType.recoveryMonthly: 1,
  ReportType.healthAssessment: 2,
  ReportType.medicationAnalysis: 3,
  ReportType.lifestyleReport: 4,
  ReportType.riskAssessment: 5,
};

const _$ReportStatusEnumMap = {
  ReportStatus.generating: 1,
  ReportStatus.ready: 2,
  ReportStatus.failed: 3,
  ReportStatus.expired: 4,
};

_ReportShareRecord _$ReportShareRecordFromJson(Map<String, dynamic> json) =>
    _ReportShareRecord(
      id: json['id'] as String,
      reportId: json['reportId'] as String,
      method: $enumDecode(_$ShareMethodEnumMap, json['method']),
      recipientInfo: json['recipientInfo'] as String?,
      sharedAt: DateTime.parse(json['shared_at'] as String),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ReportShareRecordToJson(_ReportShareRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportId': instance.reportId,
      'method': _$ShareMethodEnumMap[instance.method]!,
      'recipientInfo': instance.recipientInfo,
      'shared_at': instance.sharedAt.toIso8601String(),
      'message': instance.message,
    };

const _$ShareMethodEnumMap = {
  ShareMethod.link: 1,
  ShareMethod.wechat: 2,
  ShareMethod.email: 3,
  ShareMethod.sms: 4,
  ShareMethod.qrcode: 5,
};
