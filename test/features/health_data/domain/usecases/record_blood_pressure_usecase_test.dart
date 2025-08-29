import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';
import 'package:vitals/features/health_data/domain/usecases/record_blood_pressure_usecase.dart';
import 'package:vitals/features/health_data/presentation/providers/health_data_providers.dart';

class MockHealthDataRepository extends Mock implements HealthDataRepository {}

void main() {
  group('RecordBloodPressureUseCase', () {
    late ProviderContainer container;
    late MockHealthDataRepository mockRepository;

    setUp(() {
      mockRepository = MockHealthDataRepository();
      container = ProviderContainer(
        overrides: [
          healthDataRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should validate blood pressure data correctly', () async {
      // Given
      const patientId = 'patient_1';
      const systolic = 120;
      const diastolic = 80;

      when(() => mockRepository.addBloodPressureRecord(any(), any()))
          .thenAnswer((_) async => Result.success(BloodPressureRecord(
                id: 'test_id',
                patientId: patientId,
                systolic: systolic,
                diastolic: diastolic,
                recordedAt: DateTime.now(),
              )));

      // When - 有效数据
      final useCase = container.read(recordBloodPressureUseCaseProvider.notifier);
      final validResult = await useCase.execute(patientId, systolic, diastolic);

      // Then
      expect(validResult.isSuccess, true);
      verify(() => mockRepository.addBloodPressureRecord(patientId, any())).called(1);
    });

    test('should fail validation when systolic pressure is invalid', () async {
      // Given
      const patientId = 'patient_1';
      const systolic = 0; // 无效值
      const diastolic = 80;

      // When
      final useCase = container.read(recordBloodPressureUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, systolic, diastolic);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected validation error'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) {
              expect(field, 'systolic');
              expect(message, contains('收缩压范围无效'));
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );
    });

    test('should fail validation when diastolic pressure is invalid', () async {
      // Given
      const patientId = 'patient_1';
      const systolic = 120;
      const diastolic = 300; // 无效值

      // When
      final useCase = container.read(recordBloodPressureUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, systolic, diastolic);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected validation error'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) {
              expect(field, 'diastolic');
              expect(message, contains('舒张压范围无效'));
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );
    });

    test('should fail validation when systolic <= diastolic', () async {
      // Given
      const patientId = 'patient_1';
      const systolic = 80;
      const diastolic = 120; // 舒张压大于收缩压

      // When
      final useCase = container.read(recordBloodPressureUseCaseProvider.notifier);
      final result = await useCase.execute(patientId, systolic, diastolic);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected validation error'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) {
              expect(field, 'pressure');
              expect(message, contains('收缩压应大于舒张压'));
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );
    });

    test('should create correct request when validation passes', () async {
      // Given
      const patientId = 'patient_1';
      const systolic = 120;
      const diastolic = 80;
      const heartRate = 75;
      final recordedAt = DateTime(2024, 1, 1, 10, 30);

      when(() => mockRepository.addBloodPressureRecord(any(), any()))
          .thenAnswer((_) async => Result.success(BloodPressureRecord(
                id: 'test_id',
                patientId: patientId,
                systolic: systolic,
                diastolic: diastolic,
                recordedAt: recordedAt,
                heartRate: heartRate,
              )));

      // When
      final useCase = container.read(recordBloodPressureUseCaseProvider.notifier);
      await useCase.execute(
        patientId,
        systolic,
        diastolic,
        heartRate: heartRate,
        recordedAt: recordedAt,
      );

      // Then
      verify(() => mockRepository.addBloodPressureRecord(patientId, any())).called(1);
    });
  });
}
