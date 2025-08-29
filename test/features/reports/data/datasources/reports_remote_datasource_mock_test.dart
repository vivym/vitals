import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource_mock.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

void main() {
  group('ReportsRemoteDataSourceMock', () {
    late ReportsRemoteDataSourceMock mockDataSource;

    setUp(() {
      mockDataSource = ReportsRemoteDataSourceMock();
    });

    test('should return reports list with delay', () async {
      // Given
      const patientId = 'patient_1';

      // When
      final startTime = DateTime.now();
      final reports = await mockDataSource.getReports(patientId);
      final endTime = DateTime.now();

      // Then
      expect(reports, isA<List<HealthReport>>());
      expect(reports.length, 3);
      expect(endTime.difference(startTime).inMilliseconds, greaterThan(700));
      expect(endTime.difference(startTime).inMilliseconds, lessThan(900));
    });

    test('should return correct report data', () async {
      // Given
      const patientId = 'patient_1';

      // When
      final reports = await mockDataSource.getReports(patientId);

      // Then
      expect(reports[0].id, 'report_1');
      expect(reports[0].title, 'PCI术后康复月报');
      expect(reports[0].type, ReportType.recoveryMonthly);
      expect(reports[0].status, ReportStatus.ready);

      expect(reports[1].id, 'report_2');
      expect(reports[1].title, '健康评估报告');
      expect(reports[1].type, ReportType.healthAssessment);
      expect(reports[1].status, ReportStatus.ready);

      expect(reports[2].id, 'report_3');
      expect(reports[2].title, '2月份康复月报');
      expect(reports[2].type, ReportType.recoveryMonthly);
      expect(reports[2].status, ReportStatus.generating);
    });

    test('should generate share link with delay', () async {
      // Given
      const reportId = 'report_1';

      // When
      final startTime = DateTime.now();
      final shareLink = await mockDataSource.generateShareLink(reportId);
      final endTime = DateTime.now();

      // Then
      expect(shareLink, isA<String>());
      expect(shareLink, contains('vitals.example.com'));
      expect(shareLink, contains(reportId));
      expect(endTime.difference(startTime).inMilliseconds, greaterThan(250));
      expect(endTime.difference(startTime).inMilliseconds, lessThan(350));
    });

    test('should record share with delay', () async {
      // Given
      const reportId = 'report_1';
      const method = ShareMethod.wechat;
      const recipientInfo = 'doctor@example.com';

      // When
      final startTime = DateTime.now();
      await mockDataSource.recordShare(reportId, method, recipientInfo);
      final endTime = DateTime.now();

      // Then
      expect(endTime.difference(startTime).inMilliseconds, greaterThan(150));
      expect(endTime.difference(startTime).inMilliseconds, lessThan(250));
    });
  });
}
