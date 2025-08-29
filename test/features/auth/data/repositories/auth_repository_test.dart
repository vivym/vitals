import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:vitals/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart';
import 'package:vitals/features/auth/data/models/patient.dart';
import 'package:vitals/features/auth/data/models/user.dart';

// Mock classes
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

// Fake classes for fallback values
class FakeUser extends Fake implements User {}
class FakeLoginRequest extends Fake implements LoginRequest {}
class FakeCreatePatientRequest extends Fake implements CreatePatientRequest {}

void main() {
  group('AuthRepository', () {
    late AuthRepository repository;
    late MockAuthRemoteDataSource mockRemoteDataSource;
    late MockAuthLocalDataSource mockLocalDataSource;

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(FakeUser());
      registerFallbackValue(FakeLoginRequest());
      registerFallbackValue(FakeCreatePatientRequest());
    });

    setUp(() {
      mockRemoteDataSource = MockAuthRemoteDataSource();
      mockLocalDataSource = MockAuthLocalDataSource();
      repository = AuthRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
    });

    group('login', () {
      test('should save auth state and return success when login succeeds', () async {
        // Given
        const request = LoginRequest(phone: '13800000000', agreedToTerms: true);
        final response = LoginResponse(
          token: 'test_token',
          user: const User(id: '1', name: '张三', phone: '13800000000'),
          patients: const [],
        );

        when(() => mockRemoteDataSource.login(request))
            .thenAnswer((_) async => response);
        when(() => mockLocalDataSource.saveAuthToken(any()))
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.saveCachedUser(any()))
            .thenAnswer((_) async {});

        // When
        final result = await repository.login(request);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (loginResponse) {
            expect(loginResponse.token, 'test_token');
            expect(loginResponse.user.name, '张三');
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRemoteDataSource.login(request)).called(1);
        verify(() => mockLocalDataSource.saveAuthToken('test_token')).called(1);
        verify(() => mockLocalDataSource.saveCachedUser(response.user)).called(1);
      });

      test('should return failure when remote login fails', () async {
        // Given
        const request = LoginRequest(phone: '13800000000', agreedToTerms: true);
        const error = AppError.network(message: 'Network error');

        when(() => mockRemoteDataSource.login(request)).thenThrow(error);

        // When
        final result = await repository.login(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (appError) => expect(appError, error),
        );

        verify(() => mockRemoteDataSource.login(request)).called(1);
        verifyNever(() => mockLocalDataSource.saveAuthToken(any()));
        verifyNever(() => mockLocalDataSource.saveCachedUser(any()));
      });

      test('should wrap unknown exceptions in AppError.unknown', () async {
        // Given
        const request = LoginRequest(phone: '13800000000', agreedToTerms: true);
        final exception = Exception('Unknown error');

        when(() => mockRemoteDataSource.login(request)).thenThrow(exception);

        // When
        final result = await repository.login(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
            error.maybeWhen(
              unknown: (message, cause) {
                expect(message, contains('Exception: Unknown error'));
                expect(cause, exception);
              },
              orElse: () => fail('Expected unknown error'),
            );
          },
        );
      });
    });

    group('logout', () {
      test('should clear auth state and return success when logout succeeds', () async {
        // Given
        when(() => mockRemoteDataSource.logout()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeAuthToken()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeCachedUser()).thenAnswer((_) async {});

        // When
        final result = await repository.logout();

        // Then
        expect(result.isSuccess, true);

        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.removeAuthToken()).called(1);
        verify(() => mockLocalDataSource.removeCachedUser()).called(1);
      });

      test('should still clear local state when remote logout fails', () async {
        // Given
        const error = AppError.network(message: 'Network error');
        when(() => mockRemoteDataSource.logout()).thenThrow(error);
        when(() => mockLocalDataSource.removeAuthToken()).thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeCachedUser()).thenAnswer((_) async {});

        // When
        final result = await repository.logout();

        // Then
        expect(result.isFailure, true);

        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.removeAuthToken()).called(1);
        verify(() => mockLocalDataSource.removeCachedUser()).called(1);
      });
    });

    group('isAuthenticated', () {
      test('should return true when valid token exists', () async {
        // Given
        when(() => mockLocalDataSource.getAuthToken())
            .thenAnswer((_) async => 'valid_token');

        // When
        final result = await repository.isAuthenticated();

        // Then
        expect(result, true);
        verify(() => mockLocalDataSource.getAuthToken()).called(1);
      });

      test('should return false when token is null', () async {
        // Given
        when(() => mockLocalDataSource.getAuthToken())
            .thenAnswer((_) async => null);

        // When
        final result = await repository.isAuthenticated();

        // Then
        expect(result, false);
      });

      test('should return false when token is empty', () async {
        // Given
        when(() => mockLocalDataSource.getAuthToken())
            .thenAnswer((_) async => '');

        // When
        final result = await repository.isAuthenticated();

        // Then
        expect(result, false);
      });
    });

    group('getCurrentUser', () {
      test('should return user when remote call succeeds', () async {
        // Given
        const user = User(id: '1', name: '张三', phone: '13800000000');
        when(() => mockRemoteDataSource.getCurrentUser())
            .thenAnswer((_) async => user);

        // When
        final result = await repository.getCurrentUser();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (returnedUser) => expect(returnedUser, user),
          failure: (_) => fail('Expected success'),
        );
      });

      test('should return failure when remote call fails', () async {
        // Given
        const error = AppError.authentication(message: 'Token expired');
        when(() => mockRemoteDataSource.getCurrentUser()).thenThrow(error);

        // When
        final result = await repository.getCurrentUser();

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (appError) => expect(appError, error),
        );
      });
    });

    group('createPatient', () {
      test('should return created patient when request succeeds', () async {
        // Given
        final request = CreatePatientRequest(
          name: '李四',
          idNumber: '310101199501011234',
          gender: Gender.male,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
        );
        final patient = Patient(
          id: '2',
          name: '李四',
          idNumber: '310101199501011234',
          gender: Gender.male,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
        );

        when(() => mockRemoteDataSource.createPatient(request))
            .thenAnswer((_) async => patient);

        // When
        final result = await repository.createPatient(request);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (createdPatient) {
            expect(createdPatient.name, '李四');
            expect(createdPatient.idNumber, '310101199501011234');
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRemoteDataSource.createPatient(request)).called(1);
      });
    });

    group('terms agreement', () {
      test('should return terms agreement status from local storage', () async {
        // Given
        when(() => mockLocalDataSource.hasAgreedToTerms())
            .thenAnswer((_) async => true);

        // When
        final result = await repository.hasAgreedToTerms();

        // Then
        expect(result, true);
        verify(() => mockLocalDataSource.hasAgreedToTerms()).called(1);
      });

      test('should save terms agreement to local storage', () async {
        // Given
        when(() => mockLocalDataSource.saveTermsAgreement(true))
            .thenAnswer((_) async {});

        // When
        await repository.saveTermsAgreement(true);

        // Then
        verify(() => mockLocalDataSource.saveTermsAgreement(true)).called(1);
      });
    });

    group('cached data access', () {
      test('should return cached user from local storage', () async {
        // Given
        const user = User(id: '1', name: '张三', phone: '13800000000');
        when(() => mockLocalDataSource.getCachedUser())
            .thenAnswer((_) async => user);

        // When
        final result = await repository.getCachedUser();

        // Then
        expect(result, user);
        verify(() => mockLocalDataSource.getCachedUser()).called(1);
      });

      test('should return auth token from local storage', () async {
        // Given
        const token = 'test_token';
        when(() => mockLocalDataSource.getAuthToken())
            .thenAnswer((_) async => token);

        // When
        final result = await repository.getAuthToken();

        // Then
        expect(result, token);
        verify(() => mockLocalDataSource.getAuthToken()).called(1);
      });
    });
  });
}
