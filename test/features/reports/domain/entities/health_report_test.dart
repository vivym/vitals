import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

void main() {
  group('HealthReport', () {
    late HealthReport report;
    late DateTime testDate;

    setUp(() {
      testDate = DateTime(2024, 1, 15);
      report = HealthReport(
        id: 'report_1',
        patientId: 'patient_1',
        title: 'PCI术后康复月报',
        description: '2024年1月康复进展分析报告',
        type: ReportType.recoveryMonthly,
        reportUrl: 'https://vitals.example.com/reports/recovery-202401',
        status: ReportStatus.ready,
        generatedAt: testDate,
        periodStart: DateTime(2024, 1, 1),
        periodEnd: DateTime(2024, 1, 31),
        isRead: false,
        isShared: false,
        createdAt: testDate,
      );
    });

    test('should create HealthReport with required fields', () {
      expect(report.id, 'report_1');
      expect(report.patientId, 'patient_1');
      expect(report.title, 'PCI术后康复月报');
      expect(report.description, '2024年1月康复进展分析报告');
      expect(report.type, ReportType.recoveryMonthly);
      expect(report.reportUrl, 'https://vitals.example.com/reports/recovery-202401');
      expect(report.status, ReportStatus.ready);
      expect(report.generatedAt, testDate);
      expect(report.isRead, false);
      expect(report.isShared, false);
    });

    test('should format period description correctly', () {
      expect(report.periodDescription, '2024年01月01日 - 2024年01月31日');
    });

    test('should return empty string for period description when dates are null', () {
      final reportWithoutPeriod = report.copyWith(
        periodStart: null,
        periodEnd: null,
      );
      expect(reportWithoutPeriod.periodDescription, '');
    });

    test('should format generated date correctly', () {
      expect(report.formattedGeneratedDate, '2024年01月15日');
    });

    test('should return empty string for formatted date when generatedAt is null', () {
      final reportWithoutDate = report.copyWith(generatedAt: null);
      expect(reportWithoutDate.formattedGeneratedDate, '');
    });

    test('should identify expired reports correctly', () {
      final oldReport = report.copyWith(
        generatedAt: DateTime.now().subtract(const Duration(days: 91)),
      );
      expect(oldReport.isExpired, true);

      final recentReport = report.copyWith(
        generatedAt: DateTime.now().subtract(const Duration(days: 30)),
      );
      expect(recentReport.isExpired, false);
    });

    test('should handle copyWith correctly', () {
      final updatedReport = report.copyWith(
        isRead: true,
        isShared: true,
      );

      expect(updatedReport.isRead, true);
      expect(updatedReport.isShared, true);
      expect(updatedReport.id, report.id); // 其他字段保持不变
    });

    test('should handle JSON serialization', () {
      final json = report.toJson();
      final fromJson = HealthReport.fromJson(json);

      expect(fromJson.id, report.id);
      expect(fromJson.title, report.title);
      expect(fromJson.type, report.type);
      expect(fromJson.status, report.status);
    });
  });

  group('ReportType', () {
    test('should have correct values and labels', () {
      expect(ReportType.recoveryMonthly.value, 1);
      expect(ReportType.recoveryMonthly.label, 'PCI术后康复月报');
      expect(ReportType.recoveryMonthly.icon, Icons.calendar_month);
      expect(ReportType.recoveryMonthly.color, const Color(0xFF2196F3));

      expect(ReportType.healthAssessment.value, 2);
      expect(ReportType.healthAssessment.label, '健康评估报告');
      expect(ReportType.healthAssessment.icon, Icons.assessment);
      expect(ReportType.healthAssessment.color, const Color(0xFF4CAF50));
    });

    test('should have unique values', () {
      final values = ReportType.values.map((e) => e.value).toSet();
      expect(values.length, ReportType.values.length);
    });
  });

  group('ReportStatus', () {
    test('should have correct values and labels', () {
      expect(ReportStatus.generating.value, 1);
      expect(ReportStatus.generating.label, '生成中');
      expect(ReportStatus.generating.color, const Color(0xFFFF9800));

      expect(ReportStatus.ready.value, 2);
      expect(ReportStatus.ready.label, '已生成');
      expect(ReportStatus.ready.color, const Color(0xFF4CAF50));

      expect(ReportStatus.failed.value, 3);
      expect(ReportStatus.failed.label, '生成失败');
      expect(ReportStatus.failed.color, const Color(0xFFFF5722));
    });

    test('should have unique values', () {
      final values = ReportStatus.values.map((e) => e.value).toSet();
      expect(values.length, ReportStatus.values.length);
    });
  });
}
