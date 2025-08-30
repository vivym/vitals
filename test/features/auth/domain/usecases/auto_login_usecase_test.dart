import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase_impl.dart';
import 'package:vitals/features/auth/domain/entities/user_entity.dart';

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
                expect(message, '未找到有效的登录凭证');
              },
              orElse: () => fail('Expected authentication error'),
            );
          },
        );

        verify(() => mockRepository.isAuthenticated()).called(1);
        verifyNever(() => mockRepository.getCurrentUser());
      });

      test('should return user when authenticated', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final mockUser = UserEntity(
          id: '1',
          name: 'Test User',
          phone: '13800000000',
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => Result.success(mockUser));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (user) {
            expect(user.id, '1');
            expect(user.name, 'Test User');
            expect(user.phone, '13800000000');
            expect(user.email, 'test@example.com');
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRepository.isAuthenticated()).called(1);
        verify(() => mockRepository.getCurrentUser()).called(1);
      });
    });

    group('repository interaction', () {
      test('should call repository methods in correct order', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final mockUser = UserEntity(
          id: '1',
          name: 'Test User',
          phone: '13800000000',
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => Result.success(mockUser));

        // When
        await useCase.execute();

        // Then
        verifyInOrder([
          () => mockRepository.isAuthenticated(),
          () => mockRepository.getCurrentUser(),
        ]);
      });

      test('should handle repository authentication failure', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => false);

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        verify(() => mockRepository.isAuthenticated()).called(1);
        verifyNever(() => mockRepository.getCurrentUser());
      });

      test('should handle repository getCurrentUser failure', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final mockError = AppError.network(message: 'Network error');
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => Result.failure(mockError));

        // When
        final result = await useCase.execute();

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

        verify(() => mockRepository.isAuthenticated()).called(1);
        verify(() => mockRepository.getCurrentUser()).called(1);
      });

      test('should propagate repository exception', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final exception = Exception('Unexpected error');
        when(() => mockRepository.getCurrentUser())
            .thenThrow(exception);

        // When & Then
        expect(
          () => useCase.execute(),
          throwsA(exception),
        );
      });
    });

    group('edge cases', () {
      test('should handle repository error when user not found', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final mockError = const AppError.authentication(message: 'User not found');
        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => Result.failure(mockError));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, mockError);
            error.maybeWhen(
              authentication: (message) => expect(message, 'User not found'),
              orElse: () => fail('Expected authentication error'),
            );
          },
        );
      });

      test('should handle empty user data', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final emptyUser = UserEntity(
          id: '',
          name: '',
          phone: '',
          email: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => Result.success(emptyUser));

        // When
        final result = await useCase.execute();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (user) {
            expect(user.id, '');
            expect(user.name, '');
            expect(user.phone, '');
            expect(user.email, isNull);
          },
          failure: (_) => fail('Expected success'),
        );
      });
    });

    group('performance', () {
      test('should not make unnecessary repository calls', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => false);

        // When
        await useCase.execute();

        // Then
        verify(() => mockRepository.isAuthenticated()).called(1);
        verifyNever(() => mockRepository.getCurrentUser());
      });

      test('should handle rapid successive calls efficiently', () async {
        // Given
        when(() => mockRepository.isAuthenticated())
            .thenAnswer((_) async => true);

        final mockUser = UserEntity(
          id: '1',
          name: 'Test User',
          phone: '13800000000',
          email: 'test@example.com',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(() => mockRepository.getCurrentUser())
            .thenAnswer((_) async => Result.success(mockUser));

        // When
        final results = await Future.wait([
          useCase.execute(),
          useCase.execute(),
          useCase.execute(),
        ]);

        // Then
        for (final result in results) {
          expect(result.isSuccess, true);
        }

        verify(() => mockRepository.isAuthenticated()).called(3);
        verify(() => mockRepository.getCurrentUser()).called(3);
      });
    });
  });
}
