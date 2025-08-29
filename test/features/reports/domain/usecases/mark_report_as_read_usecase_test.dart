import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/domain/usecases/mark_report_as_read_usecase.dart';
import 'package:vitals/features/reports/data/providers/reports_providers.dart';

class MockReportsRepository extends Mock implements ReportsRepository {}

void main() {
  group('MarkReportAsReadUseCase', () {
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

    test('should mark report as read successfully', () async {
      // Given
      const reportId = 'report_1';

      when(() => mockRepository.markReportAsRead(reportId))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(markReportAsReadUseCaseProvider.notifier);
      final result = await useCase.execute(reportId);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockRepository.markReportAsRead(reportId)).called(1);
    });

    test('should handle mark as read failure', () async {
      // Given
      const reportId = 'report_1';
      const errorMessage = '标记已读失败：网络错误';

      when(() => mockRepository.markReportAsRead(reportId))
          .thenAnswer((_) async => Result.failure(AppError.network(message: errorMessage)));

      // When
      final useCase = container.read(markReportAsReadUseCaseProvider.notifier);
      final result = await useCase.execute(reportId);

      // Then
      expect(result.isFailure, true);
      expect(result.error.message, errorMessage);
      verify(() => mockRepository.markReportAsRead(reportId)).called(1);
    });

    test('should mark multiple reports as read', () async {
      // Given
      const reportId1 = 'report_1';
      const reportId2 = 'report_2';

      when(() => mockRepository.markReportAsRead(reportId1))
          .thenAnswer((_) async => const Result.success(null));
      when(() => mockRepository.markReportAsRead(reportId2))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(markReportAsReadUseCaseProvider.notifier);
      final result1 = await useCase.execute(reportId1);
      final result2 = await useCase.execute(reportId2);

      // Then
      expect(result1.isSuccess, true);
      expect(result2.isSuccess, true);
      verify(() => mockRepository.markReportAsRead(reportId1)).called(1);
      verify(() => mockRepository.markReportAsRead(reportId2)).called(1);
    });

    test('should handle empty report ID', () async {
      // Given
      const reportId = '';

      when(() => mockRepository.markReportAsRead(reportId))
          .thenAnswer((_) async => const Result.success(null));

      // When
      final useCase = container.read(markReportAsReadUseCaseProvider.notifier);
      final result = await useCase.execute(reportId);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockRepository.markReportAsRead(reportId)).called(1);
    });
  });
}

