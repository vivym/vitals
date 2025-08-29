import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource_impl.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ReportsLocalDataSourceImpl', () {
    late ReportsLocalDataSourceImpl localDataSource;
    late MockSharedPreferences mockPrefs;

    setUp(() {
      mockPrefs = MockSharedPreferences();
      localDataSource = ReportsLocalDataSourceImpl(mockPrefs);
    });

    test('should cache and retrieve reports correctly', () async {
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

      final jsonString = '[{"id":"report_1","patientId":"patient_1","title":"PCI术后康复月报","description":"2024年1月康复进展分析报告","type":1,"reportUrl":"https://vitals.example.com/reports/recovery-202401","status":2,"generatedAt":"2024-01-15T00:00:00.000Z","isRead":false,"isShared":false,"createdAt":"2024-01-15T00:00:00.000Z"}]';

      when(() => mockPrefs.getString('reports_$patientId')).thenReturn(jsonString);

      // When
      final cachedReports = await localDataSource.getCachedReports(patientId);

      // Then
      expect(cachedReports, isNotNull);
      expect(cachedReports!.length, 1);
      expect(cachedReports.first.id, 'report_1');
      expect(cachedReports.first.title, 'PCI术后康复月报');
    });

    test('should return null when no cached reports', () async {
      // Given
      const patientId = 'patient_1';

      when(() => mockPrefs.getString('reports_$patientId')).thenReturn(null);

      // When
      final cachedReports = await localDataSource.getCachedReports(patientId);

      // Then
      expect(cachedReports, isNull);
    });

    test('should mark report as read correctly', () async {
      // Given
      const reportId = 'report_1';

      when(() => mockPrefs.getStringList('read_report_ids')).thenReturn([]);
      when(() => mockPrefs.setStringList('read_report_ids', any())).thenAnswer((_) async => true);

      // When
      await localDataSource.markReportAsRead(reportId);

      // Then
      verify(() => mockPrefs.setStringList('read_report_ids', [reportId])).called(1);
    });

    test('should not duplicate read report IDs', () async {
      // Given
      const reportId = 'report_1';

      when(() => mockPrefs.getStringList('read_report_ids')).thenReturn([reportId]);
      when(() => mockPrefs.setStringList('read_report_ids', any())).thenAnswer((_) async => true);

      // When
      await localDataSource.markReportAsRead(reportId);

      // Then
      verifyNever(() => mockPrefs.setStringList('read_report_ids', any()));
    });

    test('should handle multiple read reports', () async {
      // Given
      const reportId1 = 'report_1';
      const reportId2 = 'report_2';

      when(() => mockPrefs.getStringList('read_report_ids')).thenReturn([reportId1]);
      when(() => mockPrefs.setStringList('read_report_ids', any())).thenAnswer((_) async => true);

      // When
      await localDataSource.markReportAsRead(reportId2);

      // Then
      verify(() => mockPrefs.setStringList('read_report_ids', [reportId1, reportId2])).called(1);
    });
  });
}
