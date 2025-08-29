import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// Mock 实现
class ReportsRemoteDataSourceMock implements ReportsRemoteDataSource {
  @override
  Future<List<HealthReport>> getReports(String patientId) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      HealthReport(
        id: 'report_1',
        patientId: patientId,
        title: 'PCI术后康复月报',
        description: '2024年1月康复进展分析报告',
        type: ReportType.recoveryMonthly,
        reportUrl: 'https://vitals.example.com/reports/recovery-202401',
        status: ReportStatus.ready,
        generatedAt: DateTime.now().subtract(const Duration(days: 5)),
        periodStart: DateTime(2024, 1, 1),
        periodEnd: DateTime(2024, 1, 31),
        isRead: false,
        isShared: false,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      HealthReport(
        id: 'report_2',
        patientId: patientId,
        title: '健康评估报告',
        description: '综合健康状况评估与建议',
        type: ReportType.healthAssessment,
        reportUrl: 'https://vitals.example.com/reports/assessment-202401',
        status: ReportStatus.ready,
        generatedAt: DateTime.now().subtract(const Duration(days: 10)),
        isRead: true,
        isShared: true,
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
      HealthReport(
        id: 'report_3',
        patientId: patientId,
        title: '2月份康复月报',
        description: '生成中，预计5分钟后完成',
        type: ReportType.recoveryMonthly,
        reportUrl: '',
        status: ReportStatus.generating,
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ];
  }

  @override
  Future<HealthReport> getReportById(String reportId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return HealthReport(
      id: reportId,
      patientId: 'patient_1',
      title: 'PCI术后康复月报',
      description: '2024年1月康复进展分析报告',
      type: ReportType.recoveryMonthly,
      reportUrl: 'https://vitals.example.com/reports/$reportId',
      status: ReportStatus.ready,
      generatedAt: DateTime.now().subtract(const Duration(days: 5)),
      isRead: false,
      isShared: false,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    );
  }

  @override
  Future<void> markReportAsRead(String reportId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Mock 标记为已读
  }

  @override
  Future<String> generateShareLink(String reportId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return 'https://vitals.example.com/shared/reports/$reportId?token=share_token_123';
  }

  @override
  Future<void> recordShare(String reportId, ShareMethod method, String? recipientInfo) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock 记录分享行为
  }

  @override
  Future<void> requestReportGeneration(String patientId, ReportType type) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Mock 请求生成报告
  }
}
