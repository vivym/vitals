import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/domain/usecases/get_reports_usecase.dart';
import 'package:vitals/features/reports/presentation/providers/reports_providers.dart';

void main() {
  group('GetReportsUseCase', () {
    late ProviderContainer container;
    late MockReportsRepository mockRepository;

    setUp(() {
      mockRepository = MockReportsRepository();
      container = ProviderContainer(
        overrides: [
          reportsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should get reports successfully', () async {
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

      when(() => mockRepository.getReports(patientId, forceRefresh: false))
          .thenAnswer((_) async => Result.success(reports));

      // When
      final useCase = container.read(getReportsUseCaseProvider.notifier);
      final result = await useCase.execute(patientId);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, reports);
      verify(() => mockRepository.getReports(patientId, forceRefresh: false)).called(1);
    });

    test('should get reports with force refresh', () async {
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

      when(() => mockRepository.getReports(patientId, forceRefresh: true))
          .thenAnswer((_) async => Result.success(reports));

      // When
      final useCase = container.read(getReportsUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, forceRefresh: true);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, reports);
      verify(() => mockRepository.getReports(patientId, forceRefresh: true)).called(1);
    });

    test('should handle repository error', () async {
      // Given
      const patientId = 'patient_1';
      const error = AppError.network(message: '网络错误');

      when(() => mockRepository.getReports(patientId, forceRefresh: false))
          .thenAnswer((_) async => Result.failure(error));

      // When
      final useCase = container.read(getReportsUseCaseProvider.notifier);
      final result = await useCase.execute(patientId);

      // Then
      expect(result.isFailure, true);
      expect(result.error, error);
      verify(() => mockRepository.getReports(patientId, forceRefresh: false)).called(1);
    });
  });
}

// Mock implementation for testing
class MockReportsRepository extends Mock implements ReportsRepository {}
