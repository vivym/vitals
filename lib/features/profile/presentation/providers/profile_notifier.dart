import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../shared/providers/current_user_provider.dart';
import '../../../../shared/models/user.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/entities/connected_device_entity.dart';
import '../../domain/entities/app_settings_entity.dart';
import 'profile_providers.dart';

part 'profile_notifier.g.dart';
part 'profile_notifier.freezed.dart';

/// Profile状态
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    ProfileEntity? profile,
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    String? error,
  }) = _ProfileState;
}

/// Profile通知器
@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<ProfileState> build() async {
    // 简单直接：监听用户状态，当用户状态变化时自动重新构建
    final currentUser = ref.watch(currentUserProvider);

    print('🔍 ProfileNotifier.build() - currentUser: $currentUser');

    if (currentUser == null) {
      print('❌ ProfileNotifier.build() - 用户未登录');
      return const ProfileState(error: '用户未登录');
    }

    print('✅ ProfileNotifier.build() - 开始加载用户资料: ${currentUser.name} (${currentUser.id})');
    return _loadProfile(currentUser);
  }

  /// 加载个人资料
  Future<ProfileState> _loadProfile(User currentUser) async {
    try {
      print('📝 _loadProfile() - 正在为用户 ${currentUser.id} 加载资料');

      final getProfileUsecase = ref.read(getProfileUsecaseProvider);
      final result = await getProfileUsecase(currentUser.id);

      return result.when(
        success: (profile) {
          print('✅ _loadProfile() - 加载成功: ${profile.userProfile?.name}');
          return ProfileState(profile: profile);
        },
        failure: (error) {
          print('❌ _loadProfile() - 加载失败: ${error.message}');
          return ProfileState(error: error.message);
        },
      );
    } catch (e) {
      print('💥 _loadProfile() - 异常: $e');
      return ProfileState(error: '加载个人资料失败: ${e.toString()}');
    }
  }

  /// 刷新数据
  Future<void> refresh() async {
    final currentState = state.value ?? const ProfileState();
    state = AsyncValue.data(currentState.copyWith(isRefreshing: true));

    try {
      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = AsyncValue.data(currentState.copyWith(
          isRefreshing: false,
          error: '用户未登录',
        ));
        return;
      }

      final getProfileUsecase = ref.read(getProfileUsecaseProvider);
      final result = await getProfileUsecase(currentUser.id);

      state = AsyncValue.data(
        result.when(
          success: (profile) => ProfileState(profile: profile),
          failure: (error) => ProfileState(error: error.message),
        ),
      );
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isRefreshing: false,
        error: '刷新失败: ${e.toString()}',
      ));
    }
  }

  /// 更新用户资料
  Future<void> updateUserProfile(UserProfileEntity profile) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: '用户未登录',
        ));
        return;
      }

      final updateUsecase = ref.read(updateUserProfileUsecaseProvider);
      final result = await updateUsecase(currentUser.id, profile);

      result.when(
        success: (updatedProfile) {
          final updatedProfileEntity = currentState.profile?.copyWith(
            userProfile: updatedProfile,
            lastUpdatedAt: DateTime.now(),
          );

          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            profile: updatedProfileEntity,
            error: null,
          ));
        },
        failure: (error) {
          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            error: error.message,
          ));
        },
      );
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        error: '更新用户资料失败: ${e.toString()}',
      ));
    }
  }

  /// 连接设备
  Future<void> connectDevice(ConnectedDeviceEntity device) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: '用户未登录',
        ));
        return;
      }

      final manageDevicesUsecase = ref.read(manageDevicesUsecaseProvider);
      final result = await manageDevicesUsecase.connectDevice(currentUser.id, device);

      result.when(
        success: (connectedDevice) {
          final currentDevices = currentState.profile?.connectedDevices ?? <ConnectedDeviceEntity>[];
          final updatedDevices = <ConnectedDeviceEntity>[...currentDevices, connectedDevice];
          final updatedProfileEntity = currentState.profile?.copyWith(
            connectedDevices: updatedDevices,
            lastUpdatedAt: DateTime.now(),
          );

          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            profile: updatedProfileEntity,
            error: null,
          ));
        },
        failure: (error) {
          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            error: error.message,
          ));
        },
      );
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        error: '连接设备失败: ${e.toString()}',
      ));
    }
  }

  /// 断开设备连接
  Future<void> disconnectDevice(String deviceId) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: '用户未登录',
        ));
        return;
      }

      final manageDevicesUsecase = ref.read(manageDevicesUsecaseProvider);
      final result = await manageDevicesUsecase.disconnectDevice(currentUser.id, deviceId);

      result.when(
        success: (_) {
          final currentDevices = currentState.profile?.connectedDevices ?? [];
          final updatedDevices = currentDevices.where((device) => device.id != deviceId).toList();
          final updatedProfileEntity = currentState.profile?.copyWith(
            connectedDevices: updatedDevices,
            lastUpdatedAt: DateTime.now(),
          );

          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            profile: updatedProfileEntity,
            error: null,
          ));
        },
        failure: (error) {
          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            error: error.message,
          ));
        },
      );
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        error: '断开设备连接失败: ${e.toString()}',
      ));
    }
  }

  /// 更新应用设置
  Future<void> updateAppSettings(AppSettingsEntity settings) async {
    final currentState = state.value;
    if (currentState == null) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = AsyncValue.data(currentState.copyWith(
          isLoading: false,
          error: '用户未登录',
        ));
        return;
      }

      final manageSettingsUsecase = ref.read(manageAppSettingsUsecaseProvider);
      final result = await manageSettingsUsecase.updateAppSettings(currentUser.id, settings);

      result.when(
        success: (updatedSettings) {
          final updatedProfileEntity = currentState.profile?.copyWith(
            settings: updatedSettings,
            lastUpdatedAt: DateTime.now(),
          );

          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            profile: updatedProfileEntity,
            error: null,
          ));
        },
        failure: (error) {
          state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            error: error.message,
          ));
        },
      );
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(
        isLoading: false,
        error: '更新应用设置失败: ${e.toString()}',
      ));
    }
  }

  /// 切换主题模式
  Future<void> updateThemeMode(AppThemeMode themeMode) async {
    final currentState = state.value;
    if (currentState?.profile?.settings == null) return;

    final currentSettings = currentState!.profile!.settings;
    final updatedSettings = currentSettings.copyWith(
      themeMode: themeMode,
      updatedAt: DateTime.now(),
    );

    await updateAppSettings(updatedSettings);
  }

  /// 切换通知设置
  Future<void> updateNotificationSettings({
    bool? notificationsEnabled,
    bool? healthDataNotifications,
    bool? medicationReminders,
    bool? deviceConnectionAlerts,
  }) async {
    final currentState = state.value;
    if (currentState?.profile?.settings == null) return;

    final currentSettings = currentState!.profile!.settings;
    final updatedSettings = currentSettings.copyWith(
      notificationsEnabled: notificationsEnabled ?? currentSettings.notificationsEnabled,
      healthDataNotifications: healthDataNotifications ?? currentSettings.healthDataNotifications,
      medicationReminders: medicationReminders ?? currentSettings.medicationReminders,
      deviceConnectionAlerts: deviceConnectionAlerts ?? currentSettings.deviceConnectionAlerts,
      updatedAt: DateTime.now(),
    );

    await updateAppSettings(updatedSettings);
  }
}