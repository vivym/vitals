import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/domain/usecases/request_report_generation_usecase.dart';
import 'package:vitals/features/reports/data/providers/reports_providers.dart';

class MockReportsRepository extends Mock implements ReportsRepository {}

void main() {
  group('RequestReportGenerationUseCase', () {
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

    test('should request report generation successfully', () async {
      // Given
      const patientId = 'patient_1';
      const reportType = ReportType.recoveryMonthly;

      when(() => mockRepository.requestReportGeneration(patientId, reportType))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(requestReportGenerationUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, reportType);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockRepository.requestReportGeneration(patientId, reportType)).called(1);
    });

    test('should handle request generation failure', () async {
      // Given
      const patientId = 'patient_1';
      const reportType = ReportType.healthAssessment;
      const errorMessage = '请求生成报告失败：网络错误';

      when(() => mockRepository.requestReportGeneration(patientId, reportType))
          .thenAnswer((_) async => Result.failure(AppError.network(message: errorMessage)));

      // When
      final useCase = container.read(requestReportGenerationUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, reportType);

      // Then
      expect(result.isFailure, true);
      expect(result.error.message, errorMessage);
      verify(() => mockRepository.requestReportGeneration(patientId, reportType)).called(1);
    });

    test('should request different report types', () async {
      // Given
      const patientId = 'patient_1';
      const reportType1 = ReportType.recoveryMonthly;
      const reportType2 = ReportType.healthAssessment;

      when(() => mockRepository.requestReportGeneration(patientId, reportType1))
          .thenAnswer((_) async => const Result.success(null));
      when(() => mockRepository.requestReportGeneration(patientId, reportType2))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(requestReportGenerationUseCaseProvider.notifier);
      final result1 = await useCase.execute(patientId, reportType1);
      final result2 = await useCase.execute(patientId, reportType2);

      // Then
      expect(result1.isSuccess, true);
      expect(result2.isSuccess, true);
      verify(() => mockRepository.requestReportGeneration(patientId, reportType1)).called(1);
      verify(() => mockRepository.requestReportGeneration(patientId, reportType2)).called(1);
    });

    test('should handle empty patient ID', () async {
      // Given
      const patientId = '';
      const reportType = ReportType.recoveryMonthly;

      when(() => mockRepository.requestReportGeneration(patientId, reportType))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(requestReportGenerationUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, reportType);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockRepository.requestReportGeneration(patientId, reportType)).called(1);
    });

    test('should request for different patients', () async {
      // Given
      const patientId1 = 'patient_1';
      const patientId2 = 'patient_2';
      const reportType = ReportType.recoveryMonthly;

      when(() => mockRepository.requestReportGeneration(patientId1, reportType))
          .thenAnswer((_) async => const Result.success(null));
      when(() => mockRepository.requestReportGeneration(patientId2, reportType))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(requestReportGenerationUseCaseProvider.notifier);
      final result1 = await useCase.execute(patientId1, reportType);
      final result2 = await useCase.execute(patientId2, reportType);

      // Then
      expect(result1.isSuccess, true);
      expect(result2.isSuccess, true);
      verify(() => mockRepository.requestReportGeneration(patientId1, reportType)).called(1);
      verify(() => mockRepository.requestReportGeneration(patientId2, reportType)).called(1);
    });
  });
}

