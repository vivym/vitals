import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 健康报告远程数据源接口
abstract class ReportsRemoteDataSource {
  /// 获取患者的健康报告列表
  Future<List<HealthReport>> getReports(String patientId);

  /// 根据ID获取特定报告
  Future<HealthReport> getReportById(String reportId);

  /// 标记报告为已读
  Future<void> markReportAsRead(String reportId);

  /// 生成分享链接
  Future<String> generateShareLink(String reportId);

  /// 记录分享行为
  Future<void> recordShare(String reportId, ShareMethod method, String? recipientInfo);

  /// 请求生成新报告
  Future<void> requestReportGeneration(String patientId, ReportType type);
}
