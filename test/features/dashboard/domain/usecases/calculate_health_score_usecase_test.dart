import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/dashboard/data/models/dashboard_models.dart';
import 'package:vitals/features/dashboard/domain/usecases/calculate_health_score_usecase.dart';

void main() {
  group('CalculateHealthScoreUseCase', () {
    late CalculateHealthScoreUseCase useCase;

    setUp(() {
      useCase = CalculateHealthScoreUseCase();
    });

    test('should return perfect score for optimal health data', () {
      // Given
      final healthData = HealthDataOverview(
        bloodPressure: BloodPressureSummary(
          systolic: 120,
          diastolic: 80,
          recordedAt: DateTime.now(),
          level: BloodPressureLevel.normal,
        ),
        heartRate: HeartRateSummary(
          bpm: 70,
          recordedAt: DateTime.now(),
          zone: HeartRateZone.resting,
        ),
        weight: WeightSummary(
          weight: 70.0,
          recordedAt: DateTime.now(),
          bmi: 22.0,
          bmiCategory: BMICategory.normal,
        ),
        steps: StepsSummary(
          steps: 10000,
          date: DateTime.now(),
          goal: 10000,
        ),
      );

      // When
      final score = useCase.execute(healthData);

      // Then
      expect(score, 100);
    });

    test('should return lower score for suboptimal health data', () {
      // Given
      final healthData = HealthDataOverview(
        bloodPressure: BloodPressureSummary(
          systolic: 140,
          diastolic: 90,
          recordedAt: DateTime.now(),
          level: BloodPressureLevel.stage1,
        ),
        heartRate: HeartRateSummary(
          bpm: 100,
          recordedAt: DateTime.now(),
          zone: HeartRateZone.cardio,
        ),
        weight: WeightSummary(
          weight: 85.0,
          recordedAt: DateTime.now(),
          bmi: 28.0,
          bmiCategory: BMICategory.overweight,
        ),
        steps: StepsSummary(
          steps: 5000,
          date: DateTime.now(),
          goal: 10000,
        ),
      );

      // When
      final score = useCase.execute(healthData);

      // Then
      expect(score, lessThan(80));
      expect(score, greaterThan(40));
    });

    test('should return 0 when no health data available', () {
      // Given
      const healthData = HealthDataOverview();

      // When
      final score = useCase.execute(healthData);

      // Then
      expect(score, 0);
    });
  });
}
