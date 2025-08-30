import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/entities/reports_state.dart';
import 'package:vitals/features/reports/presentation/screens/report_detail_page.dart';
import 'package:vitals/features/reports/presentation/providers/reports_page_providers.dart';

void main() {
  group('ReportDetailPage', () {
    late HealthReport mockReport;

    setUp(() {
      mockReport = HealthReport(
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
    });

    Widget createTestWidget() {
      return ProviderScope(
        overrides: [
          reportsPageNotifierProvider.overrideWith(
            () => ReportsPageNotifier()..state = ReportsState(
              reports: [mockReport],
            ),
          ),
        ],
        child: const MaterialApp(
          home: ReportDetailPage(reportId: 'report_1'),
        ),
      );
    }

    testWidgets('should display report title in app bar', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.text('PCI术后康复月报'), findsOneWidget);
    });

    testWidgets('should display report description', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.text('2024年1月康复进展分析报告'), findsOneWidget);
    });

    testWidgets('should display share button in app bar', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('should display mark as read button for unread reports', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.text('标记已读'), findsOneWidget);
    });

    testWidgets('should display status chip with correct text', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.text('已就绪'), findsOneWidget);
    });

    testWidgets('should display generation time', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.textContaining('生成时间'), findsOneWidget);
    });

    testWidgets('should handle ready status correctly', (WidgetTester tester) async {
      // Given
      final readyReport = mockReport.copyWith(status: ReportStatus.ready);

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsPageNotifierProvider.overrideWith(
              () => ReportsPageNotifier()..state = ReportsState(
                reports: [readyReport],
              ),
            ),
          ],
          child: const MaterialApp(
            home: ReportDetailPage(reportId: 'report_1'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Then
      expect(find.text('已就绪'), findsOneWidget);
    });

    testWidgets('should handle generating status correctly', (WidgetTester tester) async {
      // Given
      final generatingReport = mockReport.copyWith(
        status: ReportStatus.generating,
        reportUrl: '',
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsPageNotifierProvider.overrideWith(
              () => ReportsPageNotifier()..state = ReportsState(
                reports: [generatingReport],
              ),
            ),
          ],
          child: const MaterialApp(
            home: ReportDetailPage(reportId: 'report_1'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Then
      expect(find.text('报告正在生成中，请稍候...'), findsOneWidget);
    });

    testWidgets('should handle failed status correctly', (WidgetTester tester) async {
      // Given
      final failedReport = mockReport.copyWith(
        status: ReportStatus.failed,
        reportUrl: '',
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            reportsPageNotifierProvider.overrideWith(
              () => ReportsPageNotifier()..state = ReportsState(
                reports: [failedReport],
              ),
            ),
          ],
          child: const MaterialApp(
            home: ReportDetailPage(reportId: 'report_1'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Then
      expect(find.text('报告生成失败，请重试'), findsOneWidget);
    });
  });
}
