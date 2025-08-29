import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase_impl.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart';
import 'package:vitals/features/auth/data/models/user.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

// Fake classes
class FakeLoginRequest extends Fake implements LoginRequest {}

void main() {
  group('LoginUseCase', () {
    late LoginUseCase useCase;
    late MockAuthRepository mockRepository;

    setUpAll(() {
      registerFallbackValue(FakeLoginRequest());
    });

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
              validation: (message, field) {
                expect(field, 'terms');
                expect(message, contains('协议'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.login(any()));
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
              validation: (message, field) {
                expect(field, 'phone');
                expect(message, contains('手机号'));
              },
              orElse: () => fail('Expected validation error'),
            );
          },
        );

        verifyNever(() => mockRepository.login(any()));
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

          final response = LoginResponse(
            token: 'test_token',
            user: const User(id: '1', name: 'Test', phone: '13800000000'),
            patients: const [],
          );

          when(() => mockRepository.login(any()))
              .thenAnswer((_) async => Result.success(response));

          for (final phone in validPhones) {
            // When
            final result = await useCase.execute(phone, agreedToTerms: true);

            // Then
            expect(result.isSuccess, true, reason: 'Phone $phone should be valid');
          }
        });

        test('should reject invalid phone numbers', () async {
          // Given
          final invalidPhones = [
            '123',           // 太短
            '12345678901',   // 不以1开头
            '10800000000',   // 第二位无效
            '1380000000',    // 太短
            '138000000001',  // 太长
            '',              // 空字符串
            'abcdefghijk',   // 非数字
          ];

          for (final phone in invalidPhones) {
            // When
            final result = await useCase.execute(phone, agreedToTerms: true);

            // Then
            expect(result.isFailure, true, reason: 'Phone $phone should be invalid');
          }

          verifyNever(() => mockRepository.login(any()));
        });
      });
    });

    group('repository integration', () {
      test('should return success when repository login succeeds', () async {
        // Given
        const phone = '13800000000';
        final expectedResponse = LoginResponse(
          token: 'test_token',
          user: const User(id: '1', name: 'Test User', phone: phone),
          patients: const [],
        );

        when(() => mockRepository.login(any()))
            .thenAnswer((_) async => Result.success(expectedResponse));

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (response) {
            expect(response.token, 'test_token');
            expect(response.user.phone, phone);
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.login(
          const LoginRequest(phone: phone, agreedToTerms: true),
        )).called(1);
      });

      test('should return failure when repository login fails', () async {
        // Given
        const phone = '13800000000';
        const error = AppError.network(message: 'Network error');

        when(() => mockRepository.login(any()))
            .thenAnswer((_) async => const Result.failure(error));

        // When
        final result = await useCase.execute(phone, agreedToTerms: true);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (appError) => expect(appError, error),
        );

        verify(() => mockRepository.login(
          const LoginRequest(phone: phone, agreedToTerms: true),
        )).called(1);
      });

      test('should pass correct login request to repository', () async {
        // Given
        const phone = '13800000000';
        final response = LoginResponse(
          token: 'test_token',
          user: const User(id: '1', name: 'Test', phone: phone),
          patients: const [],
        );

        when(() => mockRepository.login(any()))
            .thenAnswer((_) async => Result.success(response));

        // When
        await useCase.execute(phone, agreedToTerms: true);

        // Then
        final captured = verify(() => mockRepository.login(captureAny())).captured;
        final loginRequest = captured.first as LoginRequest;
        expect(loginRequest.phone, phone);
        expect(loginRequest.agreedToTerms, true);
      });
    });
  });
}
