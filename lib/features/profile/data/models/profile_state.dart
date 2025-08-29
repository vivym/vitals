import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';
import 'connected_device.dart';
import 'my_service.dart';
import 'medication_reminder.dart';
import 'app_settings.dart';
import 'favorite_item.dart';

part 'profile_state.freezed.dart';

/// 个人中心状态
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserProfile? userProfile,
    @Default([]) List<ConnectedDevice> connectedDevices,
    @Default([]) List<MyService> myServices,
    @Default([]) List<MedicationReminder> medicationReminders,
    @Default([]) List<FavoriteItem> favorites,
    AppSettings? settings,
    @Default(false) bool isLoading,
    String? error,
  }) = _ProfileState;
}

/// 设备管理状态
@freezed
abstract class DeviceManagementState with _$DeviceManagementState {
  const factory DeviceManagementState({
    @Default([]) List<ConnectedDevice> connectedDevices,
    @Default([]) List<DeviceType> availableDevices,
    @Default(false) bool isConnecting,
    String? connectingDeviceId,
    String? error,
  }) = _DeviceManagementState;
}

/// 用药提醒状态
@freezed
abstract class MedicationReminderState with _$MedicationReminderState {
  const factory MedicationReminderState({
    @Default([]) List<MedicationReminder> reminders,
    @Default([]) List<DateTime> upcomingReminders,
    @Default(false) bool isLoading,
    @Default(false) bool notificationsPermissionGranted,
    String? error,
  }) = _MedicationReminderState;
}
