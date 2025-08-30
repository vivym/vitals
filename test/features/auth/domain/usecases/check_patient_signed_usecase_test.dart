import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/check_patient_signed_usecase.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('CheckPatientSignedUseCase', () {
    late CheckPatientSignedUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = CheckPatientSignedUseCaseImpl(mockRepository);
    });

    group('execute', () {
      test('should return true when patient is signed', () async {
        // Given
        when(() => mockRepository.hasSignedPatient())
            .thenAnswer((_) async => Result.success(true));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (hasSigned) {
            expect(hasSigned, isTrue);
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.hasSignedPatient()).called(1);
      });

      test('should return false when patient is not signed', () async {
        // Given
        when(() => mockRepository.hasSignedPatient())
            .thenAnswer((_) async => Result.success(false));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (hasSigned) {
            expect(hasSigned, isFalse);
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.hasSignedPatient()).called(1);
      });

      test('should return error when repository call fails', () async {
        // Given
        final expectedError = AppError.network(message: 'Network error');
        when(() => mockRepository.hasSignedPatient())
            .thenAnswer((_) async => Result.failure(expectedError));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, equals(expectedError));
            expect(error, isA<AppError>());
          },
        );

        verify(() => mockRepository.hasSignedPatient()).called(1);
      });

      test('should handle authentication errors', () async {
        // Given
        final authError = AppError.authentication(message: 'User not authenticated');
        when(() => mockRepository.hasSignedPatient())
            .thenAnswer((_) async => Result.failure(authError));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, equals(authError));
            error.maybeWhen(
              authentication: (message) {
                expect(message, equals('User not authenticated'));
              },
              orElse: () => fail('Expected authentication error'),
            );
          },
        );
      });
    });

    group('edge cases', () {
      test('should handle unknown errors', () async {
        // Given
        final unknownError = AppError.unknown(message: 'Unexpected error');
        when(() => mockRepository.hasSignedPatient())
            .thenAnswer((_) async => Result.failure(unknownError));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, equals(unknownError));
            error.maybeWhen(
              unknown: (message, cause) {
                expect(message, equals('Unexpected error'));
                expect(cause, isNull);
              },
              orElse: () => fail('Expected unknown error'),
            );
          },
        );
      });

      test('should handle validation errors', () async {
        // Given
        final validationError = AppError.validation(field: 'patient', message: 'Invalid patient data');
        when(() => mockRepository.hasSignedPatient())
            .thenAnswer((_) async => Result.failure(validationError));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, equals(validationError));
            error.maybeWhen(
              validation: (field, message) {
                expect(field, equals('patient'));
                expect(message, equals('Invalid patient data'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );
      });
    });
  });
}
