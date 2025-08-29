import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/entities/reports_state.dart';

void main() {
  group('ReportsState', () {
    late ReportsState state;
    late List<HealthReport> reports;

    setUp(() {
      reports = [
        HealthReport(
          id: 'report_1',
          patientId: 'patient_1',
          title: 'PCI术后康复月报',
          description: '2024年1月康复进展分析报告',
          type: ReportType.recoveryMonthly,
          reportUrl: 'https://vitals.example.com/reports/recovery-202401',
          status: ReportStatus.ready,
          generatedAt: DateTime(2024, 1, 15),
          periodStart: DateTime(2024, 1, 1),
          periodEnd: DateTime(2024, 1, 31),
          isRead: false,
          isShared: false,
          createdAt: DateTime(2024, 1, 15),
        ),
        HealthReport(
          id: 'report_2',
          patientId: 'patient_1',
          title: '健康评估报告',
          description: '综合健康状况评估与建议',
          type: ReportType.healthAssessment,
          reportUrl: 'https://vitals.example.com/reports/assessment-202401',
          status: ReportStatus.ready,
          generatedAt: DateTime(2024, 1, 10),
          isRead: true,
          isShared: true,
          createdAt: DateTime(2024, 1, 10),
        ),
        HealthReport(
          id: 'report_3',
          patientId: 'patient_1',
          title: '2月份康复月报',
          description: '生成中，预计5分钟后完成',
          type: ReportType.recoveryMonthly,
          reportUrl: '',
          status: ReportStatus.generating,
          createdAt: DateTime(2024, 1, 20),
        ),
      ];

      state = ReportsState(
        reports: reports,
        selectedType: ReportType.recoveryMonthly,
        isLoading: false,
        isRefreshing: false,
        lastUpdated: DateTime(2024, 1, 20),
      );
    });

    test('should create ReportsState with correct values', () {
      expect(state.reports, reports);
      expect(state.selectedType, ReportType.recoveryMonthly);
      expect(state.isLoading, false);
      expect(state.isRefreshing, false);
      expect(state.lastUpdated, DateTime(2024, 1, 20));
      expect(state.error, null);
    });

    test('should filter reports by selected type', () {
      final filteredReports = state.filteredReports;
      expect(filteredReports.length, 2);
      expect(filteredReports.every((r) => r.type == ReportType.recoveryMonthly), true);
    });

    test('should get ready reports only', () {
      final readyReports = state.readyReports;
      expect(readyReports.length, 2);
      expect(readyReports.every((r) => r.status == ReportStatus.ready), true);
    });

    test('should get unread reports from ready reports', () {
      final unreadReports = state.unreadReports;
      expect(unreadReports.length, 1);
      expect(unreadReports.first.id, 'report_1');
      expect(unreadReports.first.isRead, false);
    });

    test('should handle copyWith correctly', () {
      final updatedState = state.copyWith(
        isLoading: true,
        selectedType: ReportType.healthAssessment,
      );

      expect(updatedState.isLoading, true);
      expect(updatedState.selectedType, ReportType.healthAssessment);
      expect(updatedState.reports, state.reports); // 其他字段保持不变
    });
  });

  group('ReportDetailState', () {
    late ReportDetailState state;
    late HealthReport report;

    setUp(() {
      report = HealthReport(
        id: 'report_1',
        patientId: 'patient_1',
        title: 'PCI术后康复月报',
        description: '2024年1月康复进展分析报告',
        type: ReportType.recoveryMonthly,
        reportUrl: 'https://vitals.example.com/reports/recovery-202401',
        status: ReportStatus.ready,
        generatedAt: DateTime(2024, 1, 15),
        isRead: false,
        isShared: false,
        createdAt: DateTime(2024, 1, 15),
      );

      state = ReportDetailState(
        report: report,
        webViewState: const WebViewState(
          isLoading: true,
          loadProgress: 50,
        ),
        isSharing: false,
        shareHistory: [],
      );
    });

    test('should create ReportDetailState with correct values', () {
      expect(state.report, report);
      expect(state.webViewState.isLoading, true);
      expect(state.webViewState.loadProgress, 50);
      expect(state.isSharing, false);
      expect(state.shareError, null);
      expect(state.shareHistory, isEmpty);
    });

    test('should handle copyWith correctly', () {
      final updatedState = state.copyWith(
        isSharing: true,
        shareError: '分享失败',
      );

      expect(updatedState.isSharing, true);
      expect(updatedState.shareError, '分享失败');
      expect(updatedState.report, state.report); // 其他字段保持不变
    });

    test('should update webViewState correctly', () {
      final newWebViewState = const WebViewState(
        isLoading: false,
        loadProgress: 100,
        hasError: false,
      );

      final updatedState = state.copyWith(webViewState: newWebViewState);

      expect(updatedState.webViewState.isLoading, false);
      expect(updatedState.webViewState.loadProgress, 100);
      expect(updatedState.webViewState.hasError, false);
    });
  });
}
