import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase_impl.dart';
import 'package:vitals/features/auth/domain/entities/user_entity.dart';
import 'package:vitals/features/auth/domain/entities/patient_entity.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('LoginUseCase', () {
    late LoginUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = LoginUseCaseImpl(mockRepository);
    });

    group('business validation', () {
      test('should return validation error when terms not agreed', () async {
        // Given
        const phone = '13800000000';

        // When
        final result = await useCase.execute(phone, agreedToTerms: false);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              validation: (field, message) {
                expect(field, 'terms');
                expect(message, contains('协议'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.login(any(), agreedToTerms: any(named: 'agreedToTerms')));
      });

      test('should return validation error when phone is invalid', () async {
        // Given
        const invalidPhone = '123';

        // When
        final result = await useCase.execute(invalidPhone, agreedToTerms: true);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              validation: (field, message) {
                expect(field, 'phone');
                expect(message, contains('手机号'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.login(any(), agreedToTerms: any(named: 'agreedToTerms')));
      });

      group('phone validation', () {
        test('should accept valid phone numbers', () async {
          // Given
          final validPhones = [
            '13800000000', // 移动
            '15800000000', // 联通
            '18800000000', // 电信
            '19800000000', // 新号段
          ];

          for (final phone in validPhones) {
            // Given
            final mockUser = UserEntity(
              id: '1',
              name: 'Test User',
              phone: phone,
              email: 'test@example.com',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );

            final mockPatients = [
              PatientEntity(
                id: '1',
                name: 'Patient 1',
                idNumber: '123456789012345678',
                gender: Gender.male,
                birthDate: DateTime(1990, 1, 1),
                phone: '13800000001',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            ];

            final mockLoginResult = LoginResult(
              user: mockUser,
              token: 'test_token',
              patient: mockPatients.first,
            );

            when(() => mockRepository.login(phone, agreedToTerms: true))
                .thenAnswer((_) async => Result.success(mockLoginResult));

            // When
            // When
            final result = await useCase.execute(phone, agreedToTerms: true);

            // Then
            expect(result.isSuccess, true);
            result.when(
              success: (loginResult) {
                expect(loginResult.user.phone, phone);
                expect(loginResult.token, 'test_token');
                expect(loginResult.patient, isNotNull);
              },
              failure: (_) => fail('Expected success'),
            );
          }

          verify(() => mockRepository.login(any(), agreedToTerms: true)).called(validPhones.length);
        });

        test('should reject invalid phone numbers', () async {
          // Given
          final invalidPhones = [
            '123',           // 太短
            '1234567890',    // 太短
            '123456789012',  // 太长
            'abcdefghijk',   // 非数字
            '1234567890a',   // 包含字母
            '1234567890 ',   // 包含空格
          ];

          for (final phone in invalidPhones) {
            // When
            final result = await useCase.execute(phone, agreedToTerms: true);

            // Then
            expect(result.isFailure, true, reason: 'Phone $phone should be invalid');
            result.when(
              success: (_) => fail('Expected failure for phone: $phone'),
              failure: (error) {
                error.maybeWhen(
                  validation: (field, message) {
                    expect(field, 'phone');
                    expect(message, contains('手机号'));
                  },
                  orElse: () => fail('Expected validation error for phone: $phone'),
                );
              },
            );
          }

          verifyNever(() => mockRepository.login(any(), agreedToTerms: true));
        });
      });
    });

    group('repository interaction', () {
      test('should call repository with correct parameters when validation passes', () async {
        // Given
        const phone = '13800000000';
        const agreedToTerms = true;

        final mockUser = UserEntity(
          id: '1',
          name: 'Test User',
          phone: phone,
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final mockLoginResult = LoginResult(
          user: mockUser,
          token: 'test_token',
          patient: null,
        );

        when(() => mockRepository.login(phone, agreedToTerms: agreedToTerms))
            .thenAnswer((_) async => Result.success(mockLoginResult));

        // When
        final result = await useCase.execute(phone, agreedToTerms: agreedToTerms);

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRepository.login(phone, agreedToTerms: agreedToTerms)).called(1);
      });

      test('should handle repository success response', () async {
        // Given
        const phone = '13800000000';

        final mockUser = UserEntity(
          id: '1',
          name: 'Test User',
          phone: phone,
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final mockPatients = [
          PatientEntity(
            id: '1',
            name: 'Patient 1',
            idNumber: '123456789012345678',
            gender: Gender.male,
            birthDate: DateTime(1990, 1, 1),
            phone: '13800000001',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

                    final mockLoginResult = LoginResult(
              user: mockUser,
              token: 'test_token',
              patient: mockPatients.first,
            );

        when(() => mockRepository.login(phone, agreedToTerms: true))
            .thenAnswer((_) async => Result.success(mockLoginResult));

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (loginResult) {
            expect(loginResult.user.id, '1');
            expect(loginResult.user.name, 'Test User');
            expect(loginResult.user.phone, phone);
            expect(loginResult.token, 'test_token');
            expect(loginResult.patient, isNotNull);
            expect(loginResult.patient!.name, 'Patient 1');
          },
          failure: (_) => fail('Expected success'),
        );
      });

      test('should handle repository failure response', () async {
        // Given
        const phone = '13800000000';
        final mockError = AppError.network(message: 'Network error');

        when(() => mockRepository.login(phone, agreedToTerms: true))
            .thenAnswer((_) async => Result.failure(mockError));

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, mockError);
            error.maybeWhen(
              network: (message, statusCode) => expect(message, 'Network error'),
              orElse: () => fail('Expected network error'),
            );
          },
        );
      });

      test('should propagate repository exception', () async {
        // Given
        const phone = '13800000000';
        final exception = Exception('Unexpected error');

        when(() => mockRepository.login(phone, agreedToTerms: true))
            .thenThrow(exception);

        // When & Then
        expect(
          () => useCase.execute(phone, agreedToTerms: true),
          throwsA(exception),
        );
      });
    });

    group('edge cases', () {
      test('should handle empty phone string', () async {
        // Given
        const phone = '';

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              validation: (field, message) {
                expect(field, 'phone');
                expect(message, contains('手机号'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );
      });

      test('should handle whitespace-only phone string', () async {
        // Given
        const phone = '   ';

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              validation: (field, message) {
                expect(field, 'phone');
                expect(message, contains('手机号'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );
      });

      test('should handle very long phone string', () async {
        // Given
        const phone = '138000000001234567890';

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              validation: (field, message) {
                expect(field, 'phone');
                expect(message, contains('手机号'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );
      });
    });
  });
}
