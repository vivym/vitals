import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/features/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:vitals/features/profile/domain/repositories/profile_repository.dart';
import 'package:vitals/features/profile/domain/entities/user_profile_entity.dart';
import 'package:vitals/core/errors/app_error.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}
class FakeUserProfileEntity extends Fake implements UserProfileEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUserProfileEntity());
  });
  group('UpdateUserProfileUsecase', () {
    late MockProfileRepository mockRepository;
    late UpdateUserProfileUsecase usecase;

    setUp(() {
      mockRepository = MockProfileRepository();
      usecase = UpdateUserProfileUsecase(mockRepository);
    });

    test('should update user profile successfully', () async {
      // Given
      const profile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        email: 'wanggaonan@example.com',
        gender: Gender.male,
      );

      when(() => mockRepository.updateUserProfile('user_1', profile))
          .thenAnswer((_) async => const Result.success(profile));

      // When
      final result = await usecase('user_1', profile);

      // Then
      expect(result.isSuccess, true);
      result.when(
        success: (updatedProfile) {
          expect(updatedProfile.name, '王高南');
          expect(updatedProfile.phone, '13800000000');
          expect(updatedProfile.email, 'wanggaonan@example.com');
          expect(updatedProfile.gender, Gender.male);
        },
        failure: (_) => fail('Expected success'),
      );

      verify(() => mockRepository.updateUserProfile('user_1', profile)).called(1);
    });

    test('should validate required fields', () async {
      // Given - profile with empty name
      const invalidProfile = UserProfileEntity(
        id: 'user_1',
        name: '',
        phone: '13800000000',
      );

      // When
      final result = await usecase('user_1', invalidProfile);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) => {
              expect(field, 'name'),
              expect(message, '姓名不能为空'),
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );

      verifyNever(() => mockRepository.updateUserProfile(any(), any()));
    });

    test('should validate phone number format', () async {
      // Given - profile with invalid phone
      const invalidProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '123',
      );

      // When
      final result = await usecase('user_1', invalidProfile);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) => {
              expect(field, 'phone'),
              expect(message, '手机号格式不正确'),
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );

      verifyNever(() => mockRepository.updateUserProfile(any(), any()));
    });

    test('should validate email format when provided', () async {
      // Given - profile with invalid email
      const invalidProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        email: 'invalid-email',
      );

      // When
      final result = await usecase('user_1', invalidProfile);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) => {
              expect(field, 'email'),
              expect(message, '邮箱格式不正确'),
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );

      verifyNever(() => mockRepository.updateUserProfile(any(), any()));
    });

    test('should allow empty email', () async {
      // Given - profile without email
      const validProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        email: null,
      );

      when(() => mockRepository.updateUserProfile('user_1', validProfile))
          .thenAnswer((_) async => const Result.success(validProfile));

      // When
      final result = await usecase('user_1', validProfile);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockRepository.updateUserProfile('user_1', validProfile)).called(1);
    });

    test('should validate birth date reasonableness', () async {
      // Given - profile with unreasonable birth date (future date)
      final invalidProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        birthDate: DateTime.now().add(const Duration(days: 365)),
      );

      // When
      final result = await usecase('user_1', invalidProfile);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            validation: (field, message) => {
              expect(field, 'birthDate'),
              expect(message, '生日设置不合理'),
            },
            orElse: () => fail('Expected validation error'),
          );
        },
      );

      verifyNever(() => mockRepository.updateUserProfile(any(), any()));
    });

    test('should handle repository error', () async {
      // Given
      const profile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
      );

      when(() => mockRepository.updateUserProfile('user_1', profile))
          .thenAnswer((_) async => Result.failure(
                AppError.network(message: '网络错误'),
              ));

      // When
      final result = await usecase('user_1', profile);

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            network: (message, statusCode) => expect(message, '网络错误'),
            orElse: () => fail('Expected network error'),
          );
        },
      );
    });
  });
}
