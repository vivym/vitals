import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/profile_state.dart';
import '../../data/models/user_profile.dart';
import '../../data/models/connected_device.dart';
import '../../data/models/my_service.dart';
import '../../data/models/app_settings.dart';
import '../../data/models/favorite_item.dart';
import '../../data/providers/profile_providers.dart';

part 'profile_notifier.g.dart';

/// 个人中心状态管理
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  AsyncValue<ProfileState> build() {
    _loadProfileData();
    return const AsyncValue.loading();
  }

  Future<void> refresh() async {
    await _loadProfileData(forceRefresh: true);
  }

  Future<void> updateProfile(UserProfile profile) async {
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.updateUserProfile(profile);

    result.when(
      success: (updatedProfile) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            userProfile: updatedProfile,
          ));
        });
      },
      failure: (error) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            error: error.toString(),
          ));
        });
      },
    );
  }

  Future<void> _loadProfileData({bool forceRefresh = false}) async {
    try {
      final repository = ref.read(profileRepositoryProvider);

      final futures = [
        repository.getUserProfile(forceRefresh: forceRefresh),
        repository.getConnectedDevices(),
        repository.getMyServices(),
        repository.getFavorites(),
        repository.getAppSettings(),
      ];

      final results = await Future.wait(futures);

      state = AsyncValue.data(ProfileState(
        userProfile: results[0].when(
          success: (data) => data as UserProfile,
          failure: (_) => null,
        ),
        connectedDevices: results[1].when(
          success: (data) => data as List<ConnectedDevice>,
          failure: (_) => <ConnectedDevice>[],
        ),
        myServices: results[2].when(
          success: (data) => data as List<MyService>,
          failure: (_) => <MyService>[],
        ),
        favorites: results[3].when(
          success: (data) => data as List<FavoriteItem>,
          failure: (_) => <FavoriteItem>[],
        ),
        settings: results[4].when(
          success: (data) => data as AppSettings,
          failure: (_) => const AppSettings(),
        ),
      ));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
