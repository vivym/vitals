import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_report_model.freezed.dart';
part 'health_report_model.g.dart';

/// 健康报告数据模型 - 用于JSON序列化
@freezed
abstract class HealthReportModel with _$HealthReportModel {
  const factory HealthReportModel({
    required String id,
    @JsonKey(name: 'patient_id') required String patientId,
    required String title,
    required String description,
    required int type, // 使用int表示ReportType的value
    @JsonKey(name: 'report_url') required String reportUrl,
    required int status, // 使用int表示ReportStatus的value
    @JsonKey(name: 'generated_at') DateTime? generatedAt,
    @JsonKey(name: 'period_start') DateTime? periodStart,
    @JsonKey(name: 'period_end') DateTime? periodEnd,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'is_shared') @Default(false) bool isShared,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    Map<String, dynamic>? metadata,
  }) = _HealthReportModel;

  factory HealthReportModel.fromJson(Map<String, dynamic> json) =>
      _$HealthReportModelFromJson(json);
}

/// 报告分享记录数据模型
@freezed
abstract class ReportShareRecordModel with _$ReportShareRecordModel {
  const factory ReportShareRecordModel({
    required String id,
    @JsonKey(name: 'report_id') required String reportId,
    required int method, // 使用int表示ShareMethod的value
    @JsonKey(name: 'recipient_info') String? recipientInfo,
    @JsonKey(name: 'shared_at') required DateTime sharedAt,
    String? message,
  }) = _ReportShareRecordModel;

  factory ReportShareRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ReportShareRecordModelFromJson(json);
}
