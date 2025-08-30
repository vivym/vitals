import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource_impl.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('ReportsLocalDataSourceImpl', () {
    late ReportsLocalDataSourceImpl dataSource;
    late MockSharedPreferences mockSharedPreferences;

    const patientId = 'patient123';
    const reportId1 = 'report1';
    const reportId2 = 'report2';

    final testReport1 = HealthReport(
      id: reportId1,
      patientId: patientId,
      title: '测试报告1',
      description: '这是一个测试报告',
      type: ReportType.healthAssessment,
      reportUrl: 'https://example.com/report1.pdf',
      status: ReportStatus.ready,
      generatedAt: DateTime(2024, 1, 1),
      isRead: false,
    );

    final testReport2 = HealthReport(
      id: reportId2,
      patientId: patientId,
      title: '测试报告2',
      description: '这是另一个测试报告',
      type: ReportType.medicationAnalysis,
      reportUrl: 'https://example.com/report2.pdf',
      status: ReportStatus.ready,
      generatedAt: DateTime(2024, 1, 2),
      isRead: true,
    );

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      dataSource = ReportsLocalDataSourceImpl(mockSharedPreferences);
    });

    group('getCachedReports', () {
      test('应该返回缓存的报告列表', () async {
        // Arrange
        final reports = [testReport1, testReport2];
        final reportsJson = reports.map((r) => r.toJson()).toList();
        final encodedData = jsonEncode(reportsJson);

        when(() => mockSharedPreferences.getString('cached_reports_$patientId'))
            .thenReturn(encodedData);

        // Act
        final result = await dataSource.getCachedReports(patientId);

        // Assert
        expect(result, isNotNull);
        expect(result!.length, 2);
        expect(result[0].id, reportId1);
        expect(result[1].id, reportId2);
        verify(() => mockSharedPreferences.getString('cached_reports_$patientId')).called(1);
      });

      test('当没有缓存数据时应该返回null', () async {
        // Arrange
        when(() => mockSharedPreferences.getString('cached_reports_$patientId'))
            .thenReturn(null);

        // Act
        final result = await dataSource.getCachedReports(patientId);

        // Assert
        expect(result, isNull);
        verify(() => mockSharedPreferences.getString('cached_reports_$patientId')).called(1);
      });

      test('当JSON数据无效时应该返回null', () async {
        // Arrange
        when(() => mockSharedPreferences.getString('cached_reports_$patientId'))
            .thenReturn('invalid json');

        // Act
        final result = await dataSource.getCachedReports(patientId);

        // Assert
        expect(result, isNull);
        verify(() => mockSharedPreferences.getString('cached_reports_$patientId')).called(1);
      });
    });

    group('cacheReports', () {
      test('应该缓存报告列表', () async {
        // Arrange
        final reports = [testReport1, testReport2];
        final reportsJson = reports.map((r) => r.toJson()).toList();
        final encodedData = jsonEncode(reportsJson);

        when(() => mockSharedPreferences.setString(any(), any()))
            .thenAnswer((_) async => true);
        when(() => mockSharedPreferences.setInt(any(), any()))
            .thenAnswer((_) async => true);

        // Act
        await dataSource.cacheReports(patientId, reports);

        // Assert
        verify(() => mockSharedPreferences.setString(
          'cached_reports_$patientId',
          encodedData,
        )).called(1);
        verify(() => mockSharedPreferences.setInt(
          'cached_reports_timestamp_$patientId',
          any(),
        )).called(1);
      });

      test('应该缓存空报告列表', () async {
        // Arrange
        const reports = <HealthReport>[];
        const encodedData = '[]';

        when(() => mockSharedPreferences.setString(any(), any()))
            .thenAnswer((_) async => true);
        when(() => mockSharedPreferences.setInt(any(), any()))
            .thenAnswer((_) async => true);

        // Act
        await dataSource.cacheReports(patientId, reports);

        // Assert
        verify(() => mockSharedPreferences.setString(
          'cached_reports_$patientId',
          encodedData,
        )).called(1);
        verify(() => mockSharedPreferences.setInt(
          'cached_reports_timestamp_$patientId',
          any(),
        )).called(1);
      });
    });

    group('getReadReportIds', () {
      test('应该返回已读报告ID列表', () async {
        // Arrange
        final readIds = [reportId1, reportId2];

        when(() => mockSharedPreferences.getStringList('read_report_ids'))
            .thenReturn(readIds);

        // Act
        final result = await dataSource.getReadReportIds();

        // Assert
        expect(result, readIds);
        verify(() => mockSharedPreferences.getStringList('read_report_ids')).called(1);
      });

      test('当没有已读报告时应该返回空列表', () async {
        // Arrange
        when(() => mockSharedPreferences.getStringList('read_report_ids'))
            .thenReturn(null);

        // Act
        final result = await dataSource.getReadReportIds();

        // Assert
        expect(result, isEmpty);
        verify(() => mockSharedPreferences.getStringList('read_report_ids')).called(1);
      });
    });

    group('markReportAsRead', () {
      test('应该标记新报告为已读', () async {
        // Arrange
        final existingReadIds = [reportId1];
        final newReadIds = [reportId1, reportId2];

        when(() => mockSharedPreferences.getStringList('read_report_ids'))
            .thenReturn(existingReadIds);
        when(() => mockSharedPreferences.setStringList(any(), any()))
            .thenAnswer((_) async => true);

        // Act
        await dataSource.markReportAsRead(reportId2);

        // Assert
        verify(() => mockSharedPreferences.getStringList('read_report_ids')).called(1);
        verify(() => mockSharedPreferences.setStringList(
          'read_report_ids',
          newReadIds,
        )).called(1);
      });

      test('当报告已经是已读状态时不应该重复添加', () async {
        // Arrange
        final existingReadIds = [reportId1, reportId2];

        when(() => mockSharedPreferences.getStringList('read_report_ids'))
            .thenReturn(existingReadIds);
        when(() => mockSharedPreferences.setStringList(any(), any()))
            .thenAnswer((_) async => true);

        // Act
        await dataSource.markReportAsRead(reportId1);

        // Assert
        verify(() => mockSharedPreferences.getStringList('read_report_ids')).called(1);
        verify(() => mockSharedPreferences.setStringList(
          'read_report_ids',
          existingReadIds,
        )).called(1);
      });

      test('当没有已读记录时应该创建新的已读列表', () async {
        // Arrange
        when(() => mockSharedPreferences.getStringList('read_report_ids'))
            .thenReturn(null);
        when(() => mockSharedPreferences.setStringList(any(), any()))
            .thenAnswer((_) async => true);

        // Act
        await dataSource.markReportAsRead(reportId1);

        // Assert
        verify(() => mockSharedPreferences.getStringList('read_report_ids')).called(1);
        verify(() => mockSharedPreferences.setStringList(
          'read_report_ids',
          [reportId1],
        )).called(1);
      });
    });

    group('缓存过期检查', () {
      test('应该检查缓存是否过期', () async {
        // Arrange - 缓存了1小时前的时间戳
        final oneHourAgo = DateTime.now().subtract(const Duration(hours: 1));
        when(() => mockSharedPreferences.getInt('cached_reports_timestamp_$patientId'))
            .thenReturn(oneHourAgo.millisecondsSinceEpoch);

        // Act
        final isExpired = dataSource.isCacheExpired(patientId);

        // Assert
        expect(isExpired, isTrue);
        verify(() => mockSharedPreferences.getInt('cached_reports_timestamp_$patientId')).called(1);
      });

      test('当缓存未过期时应该返回false', () async {
        // Arrange - 缓存了10分钟前的时间戳
        final tenMinutesAgo = DateTime.now().subtract(const Duration(minutes: 10));
        when(() => mockSharedPreferences.getInt('cached_reports_timestamp_$patientId'))
            .thenReturn(tenMinutesAgo.millisecondsSinceEpoch);

        // Act
        final isExpired = dataSource.isCacheExpired(patientId);

        // Assert
        expect(isExpired, isFalse);
        verify(() => mockSharedPreferences.getInt('cached_reports_timestamp_$patientId')).called(1);
      });

      test('当没有缓存时间戳时应该返回true', () async {
        // Arrange
        when(() => mockSharedPreferences.getInt('cached_reports_timestamp_$patientId'))
            .thenReturn(null);

        // Act
        final isExpired = dataSource.isCacheExpired(patientId);

        // Assert
        expect(isExpired, isTrue);
        verify(() => mockSharedPreferences.getInt('cached_reports_timestamp_$patientId')).called(1);
      });
    });
  });
}