import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitals/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:vitals/features/auth/data/datasources/auth_local_datasource_impl.dart';
import 'package:vitals/features/auth/data/models/user.dart';

// Mock classes
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group('AuthLocalDataSource', () {
    late AuthLocalDataSource dataSource;
    late MockSharedPreferences mockPrefs;
    late MockFlutterSecureStorage mockSecureStorage;

    setUp(() {
      mockPrefs = MockSharedPreferences();
      mockSecureStorage = MockFlutterSecureStorage();
      dataSource = AuthLocalDataSourceImpl(mockPrefs, mockSecureStorage);
    });

    group('Auth Token', () {
      const testToken = 'test_token_123';

      test('should return token when it exists in secure storage', () async {
        // Given
        when(() => mockSecureStorage.read(key: 'auth_token'))
            .thenAnswer((_) async => testToken);

        // When
        final result = await dataSource.getAuthToken();

        // Then
        expect(result, testToken);
        verify(() => mockSecureStorage.read(key: 'auth_token')).called(1);
      });

      test('should return null when token does not exist', () async {
        // Given
        when(() => mockSecureStorage.read(key: 'auth_token'))
            .thenAnswer((_) async => null);

        // When
        final result = await dataSource.getAuthToken();

        // Then
        expect(result, isNull);
      });

      test('should return null when secure storage throws exception', () async {
        // Given
        when(() => mockSecureStorage.read(key: 'auth_token'))
            .thenThrow(Exception('Storage error'));

        // When
        final result = await dataSource.getAuthToken();

        // Then
        expect(result, isNull);
      });

      test('should save token to secure storage', () async {
        // Given
        when(() => mockSecureStorage.write(key: 'auth_token', value: testToken))
            .thenAnswer((_) async {});

        // When
        await dataSource.saveAuthToken(testToken);

        // Then
        verify(() => mockSecureStorage.write(key: 'auth_token', value: testToken))
            .called(1);
      });

      test('should remove token from secure storage', () async {
        // Given
        when(() => mockSecureStorage.delete(key: 'auth_token'))
            .thenAnswer((_) async {});

        // When
        await dataSource.removeAuthToken();

        // Then
        verify(() => mockSecureStorage.delete(key: 'auth_token')).called(1);
      });
    });

    group('Cached User', () {
      final testUser = User(
        id: '1',
        name: '张三',
        phone: '13800000000',
        email: 'zhangsan@example.com',
      );

      test('should return user when cached user exists', () async {
        // Given
        final userJson = jsonEncode(testUser.toJson());
        when(() => mockPrefs.getString('cached_user')).thenReturn(userJson);

        // When
        final result = await dataSource.getCachedUser();

        // Then
        expect(result?.id, testUser.id);
        expect(result?.name, testUser.name);
        expect(result?.phone, testUser.phone);
        verify(() => mockPrefs.getString('cached_user')).called(1);
      });

      test('should return null when no cached user exists', () async {
        // Given
        when(() => mockPrefs.getString('cached_user')).thenReturn(null);

        // When
        final result = await dataSource.getCachedUser();

        // Then
        expect(result, isNull);
      });

      test('should return null when cached user is invalid JSON', () async {
        // Given
        when(() => mockPrefs.getString('cached_user')).thenReturn('invalid_json');

        // When
        final result = await dataSource.getCachedUser();

        // Then
        expect(result, isNull);
      });

      test('should save user to cache', () async {
        // Given
        final userJson = jsonEncode(testUser.toJson());
        when(() => mockPrefs.setString('cached_user', userJson))
            .thenAnswer((_) async => true);

        // When
        await dataSource.saveCachedUser(testUser);

        // Then
        verify(() => mockPrefs.setString('cached_user', userJson)).called(1);
      });

      test('should remove user from cache', () async {
        // Given
        when(() => mockPrefs.remove('cached_user')).thenAnswer((_) async => true);

        // When
        await dataSource.removeCachedUser();

        // Then
        verify(() => mockPrefs.remove('cached_user')).called(1);
      });
    });

    group('Terms Agreement', () {
      test('should return true when terms have been agreed', () async {
        // Given
        when(() => mockPrefs.getBool('terms_agreed')).thenReturn(true);

        // When
        final result = await dataSource.hasAgreedToTerms();

        // Then
        expect(result, true);
        verify(() => mockPrefs.getBool('terms_agreed')).called(1);
      });

      test('should return false when terms have not been agreed', () async {
        // Given
        when(() => mockPrefs.getBool('terms_agreed')).thenReturn(false);

        // When
        final result = await dataSource.hasAgreedToTerms();

        // Then
        expect(result, false);
      });

      test('should return false when no terms agreement data exists', () async {
        // Given
        when(() => mockPrefs.getBool('terms_agreed')).thenReturn(null);

        // When
        final result = await dataSource.hasAgreedToTerms();

        // Then
        expect(result, false);
      });

      test('should save terms agreement status', () async {
        // Given
        when(() => mockPrefs.setBool('terms_agreed', true))
            .thenAnswer((_) async => true);

        // When
        await dataSource.saveTermsAgreement(true);

        // Then
        verify(() => mockPrefs.setBool('terms_agreed', true)).called(1);
      });
    });
  });
}
