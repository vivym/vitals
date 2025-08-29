import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase_impl.dart';
import 'package:vitals/features/auth/data/models/user.dart';

// Mock classes
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('AutoLoginUseCase', () {
    late AutoLoginUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = AutoLoginUseCaseImpl(mockRepository);
    });

    group('authentication check', () {
      test('should return authentication error when not authenticated', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => false);

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              authentication: (message) {
                expect(message, contains('登录凭证'));
              },
              orElse: () => fail('Expected authentication error'),
            );
          },
        );

        verify(() => mockRepository.isAuthenticated()).called(1);
        verifyNever(() => mockRepository.getCurrentUser());
      });

      test('should proceed to get user when authenticated', () async {
        // Given
        const user = User(id: '1', name: '张三', phone: '13800000000');

        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => const Result.success(user));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (returnedUser) {
            expect(returnedUser.id, '1');
            expect(returnedUser.name, '张三');
            expect(returnedUser.phone, '13800000000');
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.isAuthenticated()).called(1);
        verify(() => mockRepository.getCurrentUser()).called(1);
      });
    });

    group('user retrieval', () {
      test('should return user when repository call succeeds', () async {
        // Given
        const user = User(
          id: '2',
          name: '李四',
          phone: '13900000000',
          email: 'lisi@example.com',
        );

        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => const Result.success(user));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (returnedUser) {
            expect(returnedUser, user);
          },
          failure: (_) => fail('Expected success'),
        );
      });

      test('should return failure when repository call fails', () async {
        // Given
        const error = AppError.network(message: 'Token expired');

        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => const Result.failure(error));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (appError) => expect(appError, error),
        );
      });

      test('should handle authentication token expiration', () async {
        // Given
        const authError = AppError.authentication(message: 'Token expired');

        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => const Result.failure(authError));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, authError);
            error.maybeWhen(
              authentication: (message) {
                expect(message, contains('Token expired'));
              },
              orElse: () => fail('Expected authentication error'),
            );
          },
        );
      });
    });

    group('edge cases', () {
      test('should handle repository throwing unexpected errors', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => const Result.failure(
              AppError.unknown(message: 'Unexpected error'),
            ));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            error.maybeWhen(
              unknown: (message, cause) {
                expect(message, 'Unexpected error');
              },
              orElse: () => fail('Expected unknown error'),
            );
          },
        );
      });

      test('should not call getCurrentUser when authentication check fails', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => false);

        // When
        await useCase.execute();

        // Then
        verify(() => mockRepository.isAuthenticated()).called(1);
        verifyNever(() => mockRepository.getCurrentUser());
      });
    });
  });
}
