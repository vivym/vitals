import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

class MockReportsRemoteDataSource extends Mock implements ReportsRemoteDataSource {}
class MockReportsLocalDataSource extends Mock implements ReportsLocalDataSource {}

void main() {
  group('ReportsRepositoryImpl', () {
    late ReportsRepositoryImpl repository;
    late MockReportsRemoteDataSource mockRemoteDataSource;
    late MockReportsLocalDataSource mockLocalDataSource;

    setUp(() {
      mockRemoteDataSource = MockReportsRemoteDataSource();
      mockLocalDataSource = MockReportsLocalDataSource();
      repository = ReportsRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
    });

    test('should get reports from remote when no cache', () async {
      // Given
      const patientId = 'patient_1';
      final reports = [
        HealthReport(
          id: 'report_1',
          patientId: patientId,
          title: 'PCI术后康复月报',
          description: '2024年1月康复进展分析报告',
          type: ReportType.recoveryMonthly,
          reportUrl: 'https://vitals.example.com/reports/recovery-202401',
          status: ReportStatus.ready,
          generatedAt: DateTime(2024, 1, 15),
          isRead: false,
          isShared: false,
          createdAt: DateTime(2024, 1, 15),
        ),
      ];

      when(() => mockLocalDataSource.getCachedReports(patientId)).thenAnswer((_) async => null);
      when(() => mockRemoteDataSource.getReports(patientId)).thenAnswer((_) async => reports);
      when(() => mockLocalDataSource.cacheReports(patientId, reports)).thenAnswer((_) async {});
      when(() => mockLocalDataSource.getReadReportIds()).thenAnswer((_) async => []);

      // When
      final result = await repository.getReports(patientId);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, reports);
      verify(() => mockRemoteDataSource.getReports(patientId)).called(1);
      verify(() => mockLocalDataSource.cacheReports(patientId, reports)).called(1);
    });

    test('should get reports from cache when available', () async {
      // Given
      const patientId = 'patient_1';
      final cachedReports = [
        HealthReport(
          id: 'report_1',
          patientId: patientId,
          title: 'PCI术后康复月报',
          description: '2024年1月康复进展分析报告',
          type: ReportType.recoveryMonthly,
          reportUrl: 'https://vitals.example.com/reports/recovery-202401',
          status: ReportStatus.ready,
          generatedAt: DateTime(2024, 1, 15),
          isRead: false,
          isShared: false,
          createdAt: DateTime(2024, 1, 15),
        ),
      ];

      when(() => mockLocalDataSource.getCachedReports(patientId)).thenAnswer((_) async => cachedReports);
      when(() => mockLocalDataSource.getReadReportIds()).thenAnswer((_) async => []);

      // When
      final result = await repository.getReports(patientId);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, cachedReports);
      verifyNever(() => mockRemoteDataSource.getReports(patientId));
    });

    test('should merge read status from local data', () async {
      // Given
      const patientId = 'patient_1';
      final cachedReports = [
        HealthReport(
          id: 'report_1',
          patientId: patientId,
          title: 'PCI术后康复月报',
          description: '2024年1月康复进展分析报告',
          type: ReportType.recoveryMonthly,
          reportUrl: 'https://vitals.example.com/reports/recovery-202401',
          status: ReportStatus.ready,
          generatedAt: DateTime(2024, 1, 15),
          isRead: false,
          isShared: false,
          createdAt: DateTime(2024, 1, 15),
        ),
      ];

      when(() => mockLocalDataSource.getCachedReports(patientId)).thenAnswer((_) async => cachedReports);
      when(() => mockLocalDataSource.getReadReportIds()).thenAnswer((_) async => ['report_1']);

      // When
      final result = await repository.getReports(patientId);

      // Then
      expect(result.isSuccess, true);
      expect(result.data.first.isRead, true);
    });

    test('should handle network error and return cached data', () async {
      // Given
      const patientId = 'patient_1';
      final cachedReports = [
        HealthReport(
          id: 'report_1',
          patientId: patientId,
          title: 'PCI术后康复月报',
          description: '2024年1月康复进展分析报告',
          type: ReportType.recoveryMonthly,
          reportUrl: 'https://vitals.example.com/reports/recovery-202401',
          status: ReportStatus.ready,
          generatedAt: DateTime(2024, 1, 15),
          isRead: false,
          isShared: false,
          createdAt: DateTime(2024, 1, 15),
        ),
      ];

      when(() => mockLocalDataSource.getCachedReports(patientId)).thenAnswer((_) async => cachedReports);
      when(() => mockRemoteDataSource.getReports(patientId)).thenThrow(Exception('Network error'));
      when(() => mockLocalDataSource.getReadReportIds()).thenAnswer((_) async => []);

      // When
      final result = await repository.getReports(patientId);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, cachedReports);
    });

    test('should mark report as read successfully', () async {
      // Given
      const reportId = 'report_1';

      when(() => mockLocalDataSource.markReportAsRead(reportId)).thenAnswer((_) async {});
      when(() => mockRemoteDataSource.markReportAsRead(reportId)).thenAnswer((_) async {});

      // When
      final result = await repository.markReportAsRead(reportId);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockLocalDataSource.markReportAsRead(reportId)).called(1);
      verify(() => mockRemoteDataSource.markReportAsRead(reportId)).called(1);
    });

    test('should share report successfully', () async {
      // Given
      const reportId = 'report_1';
      const method = ShareMethod.wechat;
      const shareLink = 'https://vitals.example.com/shared/reports/$reportId';

      when(() => mockRemoteDataSource.generateShareLink(reportId)).thenAnswer((_) async => shareLink);
      when(() => mockRemoteDataSource.recordShare(reportId, method, null)).thenAnswer((_) async {});

      // When
      final result = await repository.shareReport(reportId, method);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, shareLink);
      verify(() => mockRemoteDataSource.generateShareLink(reportId)).called(1);
      verify(() => mockRemoteDataSource.recordShare(reportId, method, null)).called(1);
    });
  });
}
