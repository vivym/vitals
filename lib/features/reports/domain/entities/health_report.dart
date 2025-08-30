import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_report.freezed.dart';

// 健康报告领域实体
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
    DateTime? generatedAt,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? thumbnailUrl,
    @Default(false) bool isRead,
    @Default(false) bool isShared,
    DateTime? createdAt,
    Map<String, dynamic>? metadata,
  }) = _HealthReport;

  const HealthReport._();

  bool get isExpired {
    if (generatedAt == null) return false;
    // 报告有效期为90天
    return DateTime.now().difference(generatedAt!).inDays > 90;
  }

  bool get hasValidPeriod {
    return periodStart != null && periodEnd != null;
  }

  bool get isGenerated {
    return status == ReportStatus.ready;
  }
}

// 报告类型
enum ReportType {
  recoveryMonthly(1, 'PCI术后康复月报'),
  healthAssessment(2, '健康评估报告'),
  medicationAnalysis(3, '用药分析报告'),
  lifestyleReport(4, '生活方式报告'),
  riskAssessment(5, '风险评估报告');

  const ReportType(this.value, this.label);
  final int value;
  final String label;
}

// 报告状态
enum ReportStatus {
  generating(1, '生成中'),
  ready(2, '已生成'),
  failed(3, '生成失败'),
  expired(4, '已过期');

  const ReportStatus(this.value, this.label);
  final int value;
  final String label;
}

// 报告分享记录
@freezed
abstract class ReportShareRecord with _$ReportShareRecord {
  const factory ReportShareRecord({
    required String id,
    required String reportId,
    required ShareMethod method,
    String? recipientInfo,
    required DateTime sharedAt,
    String? message,
  }) = _ReportShareRecord;
}

// 分享方式
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


