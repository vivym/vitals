import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/create_patient_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/create_patient_usecase_impl.dart';
import 'package:vitals/features/auth/data/models/patient.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

// Fake classes
class FakeCreatePatientRequest extends Fake implements CreatePatientRequest {}

void main() {
  group('CreatePatientUseCase', () {
    late CreatePatientUseCase useCase;
    late MockAuthRepository mockRepository;

    setUpAll(() {
      registerFallbackValue(FakeCreatePatientRequest());
    });

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = CreatePatientUseCaseImpl(mockRepository);
    });

    group('validation', () {
      test('should return validation error for empty name', () async {
        // Given
        final request = CreatePatientRequest(
          name: '',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              validation: (message, field) {
                expect(field, 'name');
                expect(message, contains('姓名'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.createPatient(any()));
      });

      test('should return validation error for whitespace-only name', () async {
        // Given
        final request = CreatePatientRequest(
          name: '   ',
          idNumber: '310101199001011234',
          gender: Gender.female,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              validation: (message, field) {
                expect(field, 'name');
                expect(message, contains('姓名'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );
      });

      group('ID number validation', () {
        test('should accept valid ID numbers', () async {
          // Given
          final validIds = [
            '310101199001011234',
            '44030219900101123X',
            '44030219900101123x',
          ];

          final patient = Patient(
            id: '1',
            name: '张三',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '13800000000',
          );

          when(() => mockRepository.createPatient(any()))
              .thenAnswer((_) async => Result.success(patient));

          for (final idNumber in validIds) {
            final request = CreatePatientRequest(
              name: '张三',
              idNumber: idNumber,
              gender: Gender.male,
              birthDate: DateTime(1990, 1, 1),
              phone: '13800000000',
            );

            // When
            final result = await useCase.execute(request);

            // Then
            expect(result.isSuccess, true, reason: 'ID $idNumber should be valid');
          }
        });

        test('should reject invalid ID numbers', () async {
          // Given
          final invalidIds = [
            '12345',              // 太短
            '31010119900101123',  // 17位但缺少校验位
            '310101199001011234567', // 太长
            '310101199001011234A', // 最后一位非数字或X
            'abcdefghij123456789', // 包含字母
            '',                   // 空字符串
          ];

          for (final idNumber in invalidIds) {
            final request = CreatePatientRequest(
              name: '张三',
              idNumber: idNumber,
              gender: Gender.male,
              birthDate: DateTime(1990, 1, 1),
              phone: '13800000000',
            );

            // When
            final result = await useCase.execute(request);

            // Then
            expect(result.isFailure, true, reason: 'ID $idNumber should be invalid');
            result.when(
              success: (_) => fail('Expected failure for ID: $idNumber'),
              failure: (error) {
                error.maybeWhen(
                  validation: (message, field) {
                    expect(field, 'idNumber');
                    expect(message, contains('身份证号'));
                  },
                  orElse: () => fail('Expected validation error for ID: $idNumber'),
                );
              },
            );
          }

          verifyNever(() => mockRepository.createPatient(any()));
        });
      });

      group('phone validation', () {
        test('should accept valid phone numbers', () async {
          // Given
          final validPhones = [
            '13800000000',
            '15800000000',
            '18800000000',
            '19800000000',
          ];

          final patient = Patient(
            id: '1',
            name: '张三',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '13800000000',
          );

          when(() => mockRepository.createPatient(any()))
              .thenAnswer((_) async => Result.success(patient));

          for (final phone in validPhones) {
            final request = CreatePatientRequest(
              name: '张三',
              idNumber: '310101199001011234',
              gender: Gender.male,
              birthDate: DateTime(1990, 1, 1),
              phone: phone,
            );

            // When
            final result = await useCase.execute(request);

            // Then
            expect(result.isSuccess, true, reason: 'Phone $phone should be valid');
          }
        });

        test('should reject invalid phone numbers', () async {
          // Given
          final invalidPhones = [
            '123',
            '12345678901',
            '10800000000',
            '',
            'abcdefghijk',
          ];

          for (final phone in invalidPhones) {
            final request = CreatePatientRequest(
              name: '张三',
              idNumber: '310101199001011234',
              gender: Gender.male,
              birthDate: DateTime(1990, 1, 1),
              phone: phone,
            );

            // When
            final result = await useCase.execute(request);

            // Then
            expect(result.isFailure, true, reason: 'Phone $phone should be invalid');
          }
        });
      });

      group('birth date validation', () {
        test('should reject future birth dates', () async {
          // Given
          final futureDate = DateTime.now().add(const Duration(days: 1));
          final request = CreatePatientRequest(
            name: '张三',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: futureDate,
            phone: '13800000000',
          );

          // When
          final result = await useCase.execute(request);

          // Then
          expect(result.isFailure, true);
          result.when(
            success: (_) => fail('Expected failure'),
            failure: (error) {
              error.maybeWhen(
                validation: (message, field) {
                  expect(field, 'birthDate');
                  expect(message, contains('出生日期'));
                },
                orElse: () => fail('Expected validation error'),
              );
            },
          );
        });

        test('should reject unrealistic old birth dates', () async {
          // Given
          final oldDate = DateTime(1800, 1, 1);
          final request = CreatePatientRequest(
            name: '张三',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: oldDate,
            phone: '13800000000',
          );

          // When
          final result = await useCase.execute(request);

          // Then
          expect(result.isFailure, true);
          result.when(
            success: (_) => fail('Expected failure'),
            failure: (error) {
              error.maybeWhen(
                validation: (message, field) {
                  expect(field, 'birthDate');
                  expect(message, contains('出生日期'));
                },
                orElse: () => fail('Expected validation error'),
              );
            },
          );
        });

        test('should accept reasonable birth dates', () async {
          // Given
          final request = CreatePatientRequest(
            name: '张三',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '13800000000',
          );

          final patient = Patient(
            id: '1',
            name: '张三',
            idNumber: '310101199001011234',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '13800000000',
          );

          when(() => mockRepository.createPatient(any()))
              .thenAnswer((_) async => Result.success(patient));

          // When
          final result = await useCase.execute(request);

          // Then
          expect(result.isSuccess, true);
        });
      });
    });

    group('repository integration', () {
      test('should return success when repository call succeeds', () async {
        // Given
        final request = CreatePatientRequest(
          name: '李四',
          idNumber: '310101199501011234',
          gender: Gender.female,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
        );

        final patient = Patient(
          id: '2',
          name: '李四',
          idNumber: '310101199501011234',
          gender: Gender.female,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
        );

        when(() => mockRepository.createPatient(request))
            .thenAnswer((_) async => Result.success(patient));

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (createdPatient) {
            expect(createdPatient.name, '李四');
            expect(createdPatient.idNumber, '310101199501011234');
            expect(createdPatient.gender, Gender.female);
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.createPatient(request)).called(1);
      });

      test('should return failure when repository call fails', () async {
        // Given
        final request = CreatePatientRequest(
          name: '王五',
          idNumber: '310101199601011234',
          gender: Gender.male,
          birthDate: DateTime(1996, 1, 1),
          phone: '14000000000',
        );

        const error = AppError.network(message: 'Network error');

        when(() => mockRepository.createPatient(request))
            .thenAnswer((_) async => const Result.failure(error));

        // When
        final result = await useCase.execute(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (appError) => expect(appError, error),
        );

        verify(() => mockRepository.createPatient(request)).called(1);
      });

      test('should not call repository when validation fails', () async {
        // Given
        final request = CreatePatientRequest(
          name: '', // 无效姓名
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        // When
        await useCase.execute(request);

        // Then
        verifyNever(() => mockRepository.createPatient(any()));
      });
    });
  });
}
