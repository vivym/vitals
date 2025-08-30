import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/features/dashboard/domain/usecases/calculate_health_score_usecase.dart';
import 'package:vitals/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:vitals/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:vitals/core/errors/app_error.dart';

// Mock repository
class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  group('CalculateHealthScoreUseCase', () {
    late CalculateHealthScoreUseCaseImpl useCase;
    late MockDashboardRepository mockRepository;

    setUp(() {
      mockRepository = MockDashboardRepository();
      useCase = CalculateHealthScoreUseCaseImpl(mockRepository);
    });

    test('should return success when repository succeeds', () async {
      // Given
      const patientId = 'patient_1';
      final healthScore = HealthScoreEntity(
        totalScore: 85,
        categoryScores: {'overall': 85},
        level: HealthScoreLevel.good,
        description: '健康状况良好',
        recommendations: ['继续保持当前生活方式'],
      );

      when(() => mockRepository.calculateHealthScore(patientId))
          .thenAnswer((_) async => Result.success(healthScore));

      // When
      final result = await useCase.execute(patientId);

      // Then
      expect(result.isSuccess, true);
      expect(result.data, healthScore);
      verify(() => mockRepository.calculateHealthScore(patientId)).called(1);
    });

    test('should return error when patientId is empty', () async {
      // Given
      const patientId = '';

      // When
      final result = await useCase.execute(patientId);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (data) => fail('Should not succeed'),
        failure: (error) {
          expect(error.message, contains('患者ID不能为空'));
        },
      );
    });

    test('should return error when repository fails', () async {
      // Given
      const patientId = 'patient_1';
      final appError = AppError.network(message: '网络错误');

      when(() => mockRepository.calculateHealthScore(patientId))
          .thenAnswer((_) async => Result.failure(appError));

      // When
      final result = await useCase.execute(patientId);

      // Then
      expect(result.isFailure, true);
      expect(result.error, appError);
      verify(() => mockRepository.calculateHealthScore(patientId)).called(1);
    });

    test('should return error when repository throws exception', () async {
      // Given
      const patientId = 'patient_1';

      when(() => mockRepository.calculateHealthScore(patientId))
          .thenThrow(Exception('Repository error'));

      // When
      final result = await useCase.execute(patientId);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (data) => fail('Should not succeed'),
        failure: (error) {
          expect(error.message, contains('Repository error'));
        },
      );
      verify(() => mockRepository.calculateHealthScore(patientId)).called(1);
    });
  });
}
