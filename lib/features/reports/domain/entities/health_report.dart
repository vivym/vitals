import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'health_report.freezed.dart';
part 'health_report.g.dart';

// 健康报告
@freezed
abstract class HealthReport with _$HealthReport {
  const factory HealthReport({
    required String id,
    required String patientId,
    required String title,
    required String description,
    required ReportType type,
    required String reportUrl,
    required ReportStatus status,
    @JsonKey(name: 'generated_at') DateTime? generatedAt,
    @JsonKey(name: 'period_start') DateTime? periodStart,
    @JsonKey(name: 'period_end') DateTime? periodEnd,
    String? thumbnailUrl,
    @Default(false) bool isRead,
    @Default(false) bool isShared,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    Map<String, dynamic>? metadata,
  }) = _HealthReport;

  factory HealthReport.fromJson(Map<String, dynamic> json) =>
      _$HealthReportFromJson(json);

  const HealthReport._();

  String get periodDescription {
    if (periodStart == null || periodEnd == null) return '';

    final start = DateFormat('yyyy年MM月dd日').format(periodStart!);
    final end = DateFormat('yyyy年MM月dd日').format(periodEnd!);
    return '$start - $end';
  }

  String get formattedGeneratedDate {
    if (generatedAt == null) return '';
    return DateFormat('yyyy年MM月dd日').format(generatedAt!);
  }

  bool get isExpired {
    if (generatedAt == null) return false;
    // 报告有效期为90天
    return DateTime.now().difference(generatedAt!).inDays > 90;
  }
}

// 报告类型
@JsonEnum(valueField: 'value')
enum ReportType {
  recoveryMonthly(1, 'PCI术后康复月报', Icons.calendar_month, Color(0xFF2196F3)),
  healthAssessment(2, '健康评估报告', Icons.assessment, Color(0xFF4CAF50)),
  medicationAnalysis(3, '用药分析报告', Icons.medication, Color(0xFFFF9800)),
  lifestyleReport(4, '生活方式报告', Icons.fitness_center, Color(0xFF9C27B0)),
  riskAssessment(5, '风险评估报告', Icons.warning, Color(0xFFFF5722));

  const ReportType(this.value, this.label, this.icon, this.color);
  final int value;
  final String label;
  final IconData icon;
  final Color color;
}

// 报告状态
@JsonEnum(valueField: 'value')
enum ReportStatus {
  generating(1, '生成中', Color(0xFFFF9800)),
  ready(2, '已生成', Color(0xFF4CAF50)),
  failed(3, '生成失败', Color(0xFFFF5722)),
  expired(4, '已过期', Color(0xFF9E9E9E));

  const ReportStatus(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

// 报告分享记录
@freezed
abstract class ReportShareRecord with _$ReportShareRecord {
  const factory ReportShareRecord({
    required String id,
    required String reportId,
    required ShareMethod method,
    String? recipientInfo,
    @JsonKey(name: 'shared_at') required DateTime sharedAt,
    String? message,
  }) = _ReportShareRecord;

  factory ReportShareRecord.fromJson(Map<String, dynamic> json) =>
      _$ReportShareRecordFromJson(json);
}

// 分享方式
@JsonEnum(valueField: 'value')
enum ShareMethod {
  link(1, '复制链接'),
  wechat(2, '微信分享'),
  email(3, '邮件发送'),
  sms(4, '短信发送'),
  qrcode(5, '二维码分享');

  const ShareMethod(this.value, this.label);
  final int value;
  final String label;
}

// WebView 状态
@freezed
abstract class WebViewState with _$WebViewState {
  const factory WebViewState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    String? errorMessage,
    @Default(0) int loadProgress,
    String? currentUrl,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
  }) = _WebViewState;
}
