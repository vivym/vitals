import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 健康报告本地数据源接口
abstract class ReportsLocalDataSource {
  /// 获取缓存的报告列表
  Future<List<HealthReport>?> getCachedReports(String patientId);

  /// 缓存报告列表
  Future<void> cacheReports(String patientId, List<HealthReport> reports);

  /// 获取已读报告ID列表
  Future<List<String>> getReadReportIds();

  /// 标记报告为已读
  Future<void> markReportAsRead(String reportId);
}
