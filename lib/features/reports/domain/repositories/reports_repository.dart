import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 健康报告仓库接口
abstract class ReportsRepository {
  /// 获取患者的健康报告列表
  Future<Result<List<HealthReport>, AppError>> getReports(
    String patientId, {
    bool forceRefresh = false,
  });

  /// 根据ID获取特定报告
  Future<Result<HealthReport, AppError>> getReportById(String reportId);

  /// 标记报告为已读
  Future<Result<void, AppError>> markReportAsRead(String reportId);

  /// 分享报告
  Future<Result<String, AppError>> shareReport(
    String reportId,
    ShareMethod method, {
    String? recipientInfo,
  });

  /// 请求生成新报告
  Future<Result<void, AppError>> requestReportGeneration(
    String patientId,
    ReportType type,
  );
}
