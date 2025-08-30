import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/sign_patient_usecase.dart';
import 'package:vitals/features/auth/domain/entities/patient_entity.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignPatientUseCase', () {
    late SignPatientUseCase useCase;
    late MockAuthRepository mockRepository;

    setUpAll(() {
      // 注册 fallback 值
      registerFallbackValue(
        SignPatientRequest(
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        ),
      );
    });

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = SignPatientUseCaseImpl(mockRepository);
    });

    group('execute', () {
      test('should return patient entity when repository call is successful', () async {
        // Given
        final request = SignPatientRequest(
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final expectedPatient = PatientEntity(
          id: 'patient_123',
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.signPatient(request))
            .thenAnswer((_) async => Result.success(expectedPatient));

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (patient) {
            expect(patient, equals(expectedPatient));
            expect(patient.name, equals('Test Name'));
            expect(patient.idNumber, equals('123456789012345678'));
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.signPatient(request)).called(1);
      });

      test('should return error when repository call fails', () async {
        // Given
        final request = SignPatientRequest(
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final expectedError = AppError.network(message: 'Network error');
        when(() => mockRepository.signPatient(request))
            .thenAnswer((_) async => Result.failure(expectedError));

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, equals(expectedError));
            expect(error, isA<AppError>());
          },
        );

        verify(() => mockRepository.signPatient(request)).called(1);
      });

      test('should handle validation errors from repository', () async {
        // Given
        final request = SignPatientRequest(
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final validationError = AppError.validation(field: 'name', message: '姓名已存在');
        when(() => mockRepository.signPatient(request))
            .thenAnswer((_) async => Result.failure(validationError));

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, equals(validationError));
            error.maybeWhen(
              validation: (field, message) {
                expect(field, equals('name'));
                expect(message, equals('姓名已存在'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );
      });
    });

    group('edge cases', () {
      test('should handle empty optional fields', () async {
        // Given
        final request = SignPatientRequest(
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          // 可选字段为 null
        );

        final expectedPatient = PatientEntity(
          id: 'patient_123',
          name: 'Test Name',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.signPatient(request))
            .thenAnswer((_) async => Result.success(expectedPatient));

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (patient) {
            expect(patient.medicalRecordNumber, isNull);
            expect(patient.emergencyContact, isNull);
            expect(patient.emergencyContactPhone, isNull);
          },
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle different gender values', () async {
        // Given
        final maleRequest = SignPatientRequest(
          name: 'Male Patient',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final femaleRequest = SignPatientRequest(
          name: 'Female Patient',
          idNumber: '876543210987654321',
          gender: Gender.female,
          birthDate: DateTime(1995, 6, 15),
          phone: '13900000000',
        );

        final malePatient = PatientEntity(
          id: 'male_123',
          name: 'Male Patient',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final femalePatient = PatientEntity(
          id: 'female_123',
          name: 'Female Patient',
          idNumber: '876543210987654321',
          gender: Gender.female,
          birthDate: DateTime(1995, 6, 15),
          phone: '13900000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.signPatient(maleRequest))
            .thenAnswer((_) async => Result.success(malePatient));
        when(() => mockRepository.signPatient(femaleRequest))
            .thenAnswer((_) async => Result.success(femalePatient));

        // When & Then
        final maleResult = await useCase.execute(maleRequest);
        final femaleResult = await useCase.execute(femaleRequest);

        expect(maleResult.isSuccess, true);
        expect(femaleResult.isSuccess, true);

        maleResult.when(
          success: (patient) => expect(patient.gender, equals(Gender.male)),
          failure: (_) => fail('Expected success'),
        );

        femaleResult.when(
          success: (patient) => expect(patient.gender, equals(Gender.female)),
          failure: (_) => fail('Expected success'),
        );
      });
    });
  });
}
