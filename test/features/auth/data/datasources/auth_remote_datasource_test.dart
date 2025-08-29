import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/core/network/api_client.dart';
import 'package:vitals/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:vitals/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart';
import 'package:vitals/features/auth/data/models/patient.dart';
import 'package:vitals/features/auth/data/models/user.dart';

// Mock classes
class MockApiClient extends Mock implements ApiClient {}

void main() {
  group('AuthRemoteDataSource', () {
    late AuthRemoteDataSource dataSource;
    late MockApiClient mockApiClient;

    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = AuthRemoteDataSourceImpl(mockApiClient);
    });

    group('login', () {
      test('should return LoginResponse when login is successful', () async {
        // Given
        const request = LoginRequest(phone: '13800000000', agreedToTerms: true);
        final expectedResponse = {
          'success': true,
          'data': {
            'token': 'test_token',
            'user': {
              'id': '1',
              'name': '张三',
              'phone': '13800000000',
              'email': 'zhangsan@example.com',
            },
            'patients': [],
          },
          'message': '登录成功',
        };

        when(() => mockApiClient.post<Map<String, dynamic>>(
              '/auth/mock-login',
              data: request.toJson(),
            )).thenAnswer((_) async => expectedResponse);

        // When
        final result = await dataSource.login(request);

        // Then
        expect(result.token, 'test_token');
        expect(result.user.name, '张三');
        expect(result.user.phone, '13800000000');
        expect(result.patients, isEmpty);

        verify(() => mockApiClient.post<Map<String, dynamic>>(
              '/auth/mock-login',
              data: request.toJson(),
            )).called(1);
      });

      test('should throw AppError when login fails', () async {
        // Given
        const request = LoginRequest(phone: '13800000000', agreedToTerms: true);

        when(() => mockApiClient.post<Map<String, dynamic>>(
              '/auth/mock-login',
              data: request.toJson(),
            )).thenThrow(Exception('Network error'));

        // When & Then
        expect(
          () async => await dataSource.login(request),
          throwsA(isA<AppError>()),
        );
      });
    });

    group('logout', () {
      test('should call logout endpoint', () async {
        // Given
        when(() => mockApiClient.post('/auth/logout')).thenAnswer((_) async => {});

        // When
        await dataSource.logout();

        // Then
        verify(() => mockApiClient.post('/auth/logout')).called(1);
      });

      test('should not throw when logout fails', () async {
        // Given
        when(() => mockApiClient.post('/auth/logout')).thenThrow(Exception('Network error'));

        // When & Then
        expect(() async => await dataSource.logout(), returnsNormally);
      });
    });

    group('getCurrentUser', () {
      test('should return User when request is successful', () async {
        // Given
        final expectedResponse = {
          'id': '1',
          'name': '张三',
          'phone': '13800000000',
          'email': 'zhangsan@example.com',
        };

        when(() => mockApiClient.get<Map<String, dynamic>>('/auth/user'))
            .thenAnswer((_) async => expectedResponse);

        // When
        final result = await dataSource.getCurrentUser();

        // Then
        expect(result.id, '1');
        expect(result.name, '张三');
        expect(result.phone, '13800000000');

        verify(() => mockApiClient.get<Map<String, dynamic>>('/auth/user')).called(1);
      });

      test('should throw AppError when request fails', () async {
        // Given
        when(() => mockApiClient.get<Map<String, dynamic>>('/auth/user'))
            .thenThrow(Exception('Network error'));

        // When & Then
        expect(
          () async => await dataSource.getCurrentUser(),
          throwsA(isA<AppError>()),
        );
      });
    });

    group('getPatients', () {
      test('should return list of patients when request is successful', () async {
        // Given
        final expectedResponse = [
          {
            'id': '1',
            'name': '张三',
            'id_number': '310101199001011234',
            'gender': 1,
            'birth_date': '1990-01-01T00:00:00.000Z',
            'phone': '13800000000',
          },
        ];

        when(() => mockApiClient.get<List<dynamic>>('/auth/patients'))
            .thenAnswer((_) async => expectedResponse);

        // When
        final result = await dataSource.getPatients();

        // Then
        expect(result, hasLength(1));
        expect(result.first.name, '张三');
        expect(result.first.idNumber, '310101199001011234');

        verify(() => mockApiClient.get<List<dynamic>>('/auth/patients')).called(1);
      });
    });

    group('createPatient', () {
      test('should return created patient when request is successful', () async {
        // Given
        final request = CreatePatientRequest(
          name: '李四',
          idNumber: '310101199501011234',
          gender: Gender.male,
          birthDate: DateTime(1995, 1, 1),
          phone: '13900000000',
        );

        final expectedResponse = {
          'id': '2',
          'name': '李四',
          'id_number': '310101199501011234',
          'gender': 1,
          'birth_date': '1995-01-01T00:00:00.000Z',
          'phone': '13900000000',
        };

        when(() => mockApiClient.post<Map<String, dynamic>>(
              '/auth/patients',
              data: request.toJson(),
            )).thenAnswer((_) async => expectedResponse);

        // When
        final result = await dataSource.createPatient(request);

        // Then
        expect(result.id, '2');
        expect(result.name, '李四');
        expect(result.idNumber, '310101199501011234');

        verify(() => mockApiClient.post<Map<String, dynamic>>(
              '/auth/patients',
              data: request.toJson(),
            )).called(1);
      });
    });
  });
}
