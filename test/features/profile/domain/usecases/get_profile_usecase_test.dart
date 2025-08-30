import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:vitals/features/profile/domain/repositories/profile_repository.dart';
import 'package:vitals/features/profile/domain/entities/profile_entity.dart';
import 'package:vitals/features/profile/domain/entities/user_profile_entity.dart';
import 'package:vitals/features/profile/domain/entities/connected_device_entity.dart';
import 'package:vitals/features/profile/domain/entities/app_settings_entity.dart';
import 'package:vitals/core/errors/app_error.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  group('GetProfileUsecase', () {
    late MockProfileRepository mockRepository;
    late GetProfileUsecase usecase;

    setUp(() {
      mockRepository = MockProfileRepository();
      usecase = GetProfileUsecase(mockRepository);
    });

    test('should get profile successfully', () async {
      // Given
      const expectedProfile = ProfileEntity(
        userProfile: UserProfileEntity(
          id: 'user_1',
          name: '王高南',
          phone: '13800000000',
          email: 'wanggaonan@example.com',
          gender: Gender.male,
          birthDate: null,
        ),
        connectedDevices: [
          ConnectedDeviceEntity(
            id: 'device_1',
            name: '华为手环',
            type: DeviceType.fitnessTracker,
            status: DeviceStatus.connected,
          ),
        ],
        settings: AppSettingsEntity(),
      );

      when(() => mockRepository.getProfile('user_1'))
          .thenAnswer((_) async => const Result.success(expectedProfile));

      // When
      final result = await usecase('user_1');

      // Then
      expect(result.isSuccess, true);
      result.when(
        success: (profile) {
          expect(profile.userProfile?.name, '王高南');
          expect(profile.userProfile?.phone, '13800000000');
          expect(profile.userProfile?.gender, Gender.male);
          expect(profile.connectedDevices.length, 1);
          expect(profile.connectedDevices.first.name, '华为手环');
        },
        failure: (_) => fail('Expected success'),
      );

      verify(() => mockRepository.getProfile('user_1')).called(1);
    });

    test('should handle repository error', () async {
      // Given
      when(() => mockRepository.getProfile('user_1'))
          .thenAnswer((_) async => Result.failure(
                AppError.network(message: '网络错误'),
              ));

      // When
      final result = await usecase('user_1');

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

      verify(() => mockRepository.getProfile('user_1')).called(1);
    });

    test('should handle exception and return unknown error', () async {
      // Given
      when(() => mockRepository.getProfile('user_1'))
          .thenThrow(Exception('Unexpected error'));

      // When
      final result = await usecase('user_1');

      // Then
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Expected failure'),
        failure: (error) {
          expect(error, isA<AppError>());
          error.maybeWhen(
            unknown: (message, error) => expect(message, contains('获取个人资料失败')),
            orElse: () => fail('Expected unknown error'),
          );
        },
      );
    });

    test('should handle empty user id', () async {
      // When
      final result = await usecase('');

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
}
