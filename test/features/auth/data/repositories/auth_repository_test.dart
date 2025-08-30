import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:vitals/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/entities/patient_entity.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart' as data;
import 'package:vitals/features/auth/data/models/patient.dart' as data;
import 'package:vitals/features/auth/data/models/user.dart' as data;

// Mock classes
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

// Fake classes for fallback values
class FakeUser extends Fake implements data.User {}
class FakePatient extends Fake implements data.Patient {}
class FakeLoginRequest extends Fake implements data.LoginRequest {}
class FakeSignPatientRequest extends Fake implements data.SignPatientRequest {}

void main() {
  group('AuthRepository', () {
    late AuthRepository repository;
    late MockAuthRemoteDataSource mockRemoteDataSource;
    late MockAuthLocalDataSource mockLocalDataSource;

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(FakeUser());
      registerFallbackValue(FakePatient());
      registerFallbackValue(FakeLoginRequest());
      registerFallbackValue(FakeSignPatientRequest());
    });

    setUp(() {
      mockRemoteDataSource = MockAuthRemoteDataSource();
      mockLocalDataSource = MockAuthLocalDataSource();
      repository = AuthRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
    });

    group('login', () {
      test('should save auth state and return success when login succeeds', () async {
        // Given
        const phone = '13800000000';
        const agreedToTerms = true;

        final user = data.User(id: '1', name: '张三', phone: '13800000000');
        final patient = data.Patient(
          id: '1',
          name: '张三',
          idNumber: '310101199001011234',
          gender: data.Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final loginResponse = data.LoginResponse(
          token: 'test_token',
          user: user,
          patient: patient,
        );

        when(() => mockRemoteDataSource.login(any()))
            .thenAnswer((_) async => loginResponse);
        when(() => mockLocalDataSource.saveAuthToken(any()))
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.saveCachedUser(any()))
            .thenAnswer((_) async {});

        // When
        final result = await repository.login(phone, agreedToTerms: agreedToTerms);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (loginResult) {
            expect(loginResult.token, 'test_token');
            expect(loginResult.user.name, '张三');
            expect(loginResult.patient, isNotNull);
            expect(loginResult.patient!.name, '张三');
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRemoteDataSource.login(any())).called(1);
        verify(() => mockLocalDataSource.saveAuthToken('test_token')).called(1);
        verify(() => mockLocalDataSource.saveCachedUser(any())).called(1);
      });

      test('should return failure when remote login fails', () async {
        // Given
        const phone = '13800000000';
        const error = AppError.network(message: 'Network error');

        when(() => mockRemoteDataSource.login(any())).thenThrow(error);

        // When
        final result = await repository.login(phone);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
          },
        );

        verify(() => mockRemoteDataSource.login(any())).called(1);
        verifyNever(() => mockLocalDataSource.saveAuthToken(any()));
        verifyNever(() => mockLocalDataSource.saveCachedUser(any()));
      });

      test('should call remote data source when terms agreed', () async {
        // Given
        const phone = '13800000000';
        const agreedToTerms = true;

        final user = data.User(id: '1', name: '张三', phone: '13800000000');
        final patient = data.Patient(
          id: '1',
          name: '张三',
          idNumber: '310101199001011234',
          gender: data.Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final loginResponse = data.LoginResponse(
          token: 'test_token',
          user: user,
          patient: patient,
        );

        when(() => mockRemoteDataSource.login(any()))
            .thenAnswer((_) async => loginResponse);
        when(() => mockLocalDataSource.saveAuthToken(any()))
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.saveCachedUser(any()))
            .thenAnswer((_) async {});

        // When
        final result = await repository.login(phone, agreedToTerms: agreedToTerms);

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRemoteDataSource.login(any())).called(1);
        verify(() => mockLocalDataSource.saveAuthToken('test_token')).called(1);
        verify(() => mockLocalDataSource.saveCachedUser(any())).called(1);
      });
    });

    group('signPatient', () {
      test('should return patient entity when signing succeeds', () async {
        // Given
        final request = SignPatientRequest(
          name: 'Test Patient',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final dataPatient = data.Patient(
          id: 'patient_123',
          name: 'Test Patient',
          idNumber: '123456789012345678',
          gender: data.Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        when(() => mockRemoteDataSource.signPatient(any()))
            .thenAnswer((_) async => dataPatient);

        // When
        final result = await repository.signPatient(request);

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (patient) {
            expect(patient.name, 'Test Patient');
            expect(patient.idNumber, '123456789012345678');
            expect(patient.gender, Gender.male);
          },
          failure: (_) => fail('Expected success'),
        );

        verify(() => mockRemoteDataSource.signPatient(any())).called(1);
      });

      test('should return error when signing fails', () async {
        // Given
        final request = SignPatientRequest(
          name: 'Test Patient',
          idNumber: '123456789012345678',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final error = AppError.network(message: 'Network error');
        when(() => mockRemoteDataSource.signPatient(any())).thenThrow(error);

        // When
        final result = await repository.signPatient(request);

        // Then
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Expected failure'),
          failure: (error) {
            expect(error, isA<AppError>());
          },
        );
      });
    });

    group('getPatient', () {
      test('should return patient entity when patient exists', () async {
        // Given
        final dataPatient = data.Patient(
          id: 'patient_123',
          name: 'Test Patient',
          idNumber: '123456789012345678',
          gender: data.Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        when(() => mockRemoteDataSource.getPatient())
            .thenAnswer((_) async => dataPatient);

        // When
        final result = await repository.getPatient();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (patient) {
            expect(patient, isNotNull);
            expect(patient!.name, 'Test Patient');
          },
          failure: (_) => fail('Expected success'),
        );
      });

      test('should return null when no patient exists', () async {
        // Given
        when(() => mockRemoteDataSource.getPatient())
            .thenAnswer((_) async => null);

        // When
        final result = await repository.getPatient();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (patient) {
            expect(patient, isNull);
          },
          failure: (_) => fail('Expected success'),
        );
      });
    });

    group('hasSignedPatient', () {
      test('should return true when patient exists', () async {
        // Given
        final dataPatient = data.Patient(
          id: 'patient_123',
          name: 'Test Patient',
          idNumber: '123456789012345678',
          gender: data.Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        when(() => mockRemoteDataSource.getPatient())
            .thenAnswer((_) async => dataPatient);

        // When
        final result = await repository.hasSignedPatient();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (hasSigned) {
            expect(hasSigned, isTrue);
          },
          failure: (_) => fail('Expected success'),
        );
      });

      test('should return false when no patient exists', () async {
        // Given
        when(() => mockRemoteDataSource.getPatient())
            .thenAnswer((_) async => null);

        // When
        final result = await repository.hasSignedPatient();

        // Then
        expect(result.isSuccess, true);
        result.when(
          success: (hasSigned) {
            expect(hasSigned, isFalse);
          },
          failure: (_) => fail('Expected success'),
        );
      });
    });

    group('logout', () {
      test('should clear local data and return success', () async {
        // Given
        when(() => mockRemoteDataSource.logout())
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeAuthToken())
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeCachedUser())
            .thenAnswer((_) async {});

        // When
        final result = await repository.logout();

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.removeAuthToken()).called(1);
        verify(() => mockLocalDataSource.removeCachedUser()).called(1);
      });

      test('should handle local data clearing errors', () async {
        // Given
        when(() => mockRemoteDataSource.logout())
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeAuthToken())
            .thenAnswer((_) async {});
        when(() => mockLocalDataSource.removeCachedUser())
            .thenAnswer((_) async {});

        // When
        final result = await repository.logout();

        // Then
        expect(result.isSuccess, true);
        verify(() => mockRemoteDataSource.logout()).called(1);
        verify(() => mockLocalDataSource.removeAuthToken()).called(1);
        verify(() => mockLocalDataSource.removeCachedUser()).called(1);
      });
    });


  });
}
