import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/domain/usecases/share_report_usecase.dart';
import 'package:vitals/features/reports/presentation/providers/reports_providers.dart';

class MockReportsRepository extends Mock implements ReportsRepository {}

void main() {
  group('ShareReportUseCase', () {
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

    test('should share report successfully', () async {
      // Given
      const reportId = 'report_1';
      const method = ShareMethod.wechat;
      const shareLink = 'https://vitals.example.com/shared/reports/report_1';

      when(() => mockRepository.shareReport(reportId, method))
          .thenAnswer((_) async => Result.success(shareLink));

      // When
      final useCase = container.read(shareReportUseCaseProvider.notifier);
      final result = await useCase.execute(reportId, method);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, shareLink);
      verify(() => mockRepository.shareReport(reportId, method)).called(1);
    });

    test('should handle share failure', () async {
      // Given
      const reportId = 'report_1';
      const method = ShareMethod.wechat;
      const errorMessage = '分享失败：网络错误';

      when(() => mockRepository.shareReport(reportId, method))
          .thenAnswer((_) async => Result.failure(AppError.network(message: errorMessage)));

      // When
      final useCase = container.read(shareReportUseCaseProvider.notifier);
      final result = await useCase.execute(reportId, method);

      // Then
      expect(result.isFailure, true);
      expect(result.error.message, errorMessage);
      verify(() => mockRepository.shareReport(reportId, method)).called(1);
    });

    test('should share report with email method', () async {
      // Given
      const reportId = 'report_1';
      const method = ShareMethod.email;
      const shareLink = 'https://vitals.example.com/shared/reports/report_1';

      when(() => mockRepository.shareReport(reportId, method))
          .thenAnswer((_) async => Result.success(shareLink));

      // When
      final useCase = container.read(shareReportUseCaseProvider.notifier);
      final result = await useCase.execute(reportId, method);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, shareLink);
      verify(() => mockRepository.shareReport(reportId, method)).called(1);
    });

    test('should share report with link method', () async {
      // Given
      const reportId = 'report_1';
      const method = ShareMethod.link;
      const shareLink = 'https://vitals.example.com/shared/reports/report_1';

      when(() => mockRepository.shareReport(reportId, method))
          .thenAnswer((_) async => Result.success(shareLink));

      // When
      final useCase = container.read(shareReportUseCaseProvider.notifier);
      final result = await useCase.execute(reportId, method);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, shareLink);
      verify(() => mockRepository.shareReport(reportId, method)).called(1);
    });
  });
}
