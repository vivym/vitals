import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vitals/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:vitals/features/profile/domain/repositories/profile_repository.dart';
import 'package:vitals/features/profile/data/models/user_profile.dart';
import 'package:vitals/features/profile/data/providers/profile_providers.dart';
import 'package:vitals/core/errors/app_error.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  group('GetUserProfileUseCase', () {
    late ProviderContainer container;
    late MockProfileRepository mockRepository;

    setUp(() {
      mockRepository = MockProfileRepository();
      container = ProviderContainer(
        overrides: [
          profileRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should get user profile successfully', () async {
      // Given
      final expectedProfile = UserProfile(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        email: 'wanggaonan@example.com',
        gender: Gender.male,
        birthDate: DateTime(1990, 5, 15),
      );

      when(() => mockRepository.getUserProfile(forceRefresh: false))
          .thenAnswer((_) async => Result.success(expectedProfile));

      // When
      final useCase = container.read(getUserProfileUseCaseProvider.notifier);
      final result = await useCase.execute();

      // Then
      expect(result.isSuccess, true);
      result.when(
        success: (profile) {
          expect(profile.name, '王高南');
          expect(profile.phone, '13800000000');
          expect(profile.gender, Gender.male);
        },
        failure: (_) => fail('Expected success'),
      );
    });

    test('should handle repository error', () async {
      // Given
      when(() => mockRepository.getUserProfile(forceRefresh: false))
          .thenAnswer((_) async => Result.failure(
                AppError.network(message: '网络错误'),
              ));

      // When
      final useCase = container.read(getUserProfileUseCaseProvider.notifier);
      final result = await useCase.execute();

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

    test('should force refresh when requested', () async {
      // Given
      final expectedProfile = UserProfile(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
      );

      when(() => mockRepository.getUserProfile(forceRefresh: true))
          .thenAnswer((_) async => Result.success(expectedProfile));

      // When
      final useCase = container.read(getUserProfileUseCaseProvider.notifier);
      final result = await useCase.execute(forceRefresh: true);

      // Then
      expect(result.isSuccess, true);
      verify(() => mockRepository.getUserProfile(forceRefresh: true)).called(1);
    });
  });
}
