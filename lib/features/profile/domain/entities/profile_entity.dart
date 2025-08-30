import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile_entity.dart';
import 'connected_device_entity.dart';
import 'app_settings_entity.dart';

part 'profile_entity.freezed.dart';

/// 个人中心聚合实体
@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    UserProfileEntity? userProfile,
    @Default([]) List<ConnectedDeviceEntity> connectedDevices,
    @Default(AppSettingsEntity()) AppSettingsEntity settings,
    DateTime? lastUpdatedAt,
  }) = _ProfileEntity;

  const ProfileEntity._();

  /// 是否有用户资料
  bool get hasUserProfile => userProfile != null;

  /// 是否有连接的设备
  bool get hasConnectedDevices => connectedDevices.isNotEmpty;

  /// 获取活跃设备数量
  int get activeDeviceCount =>
      connectedDevices.where((device) => device.status.isActive).length;

  /// 获取设备类型统计
  Map<DeviceType, int> get deviceTypeStats {
    final stats = <DeviceType, int>{};
    for (final device in connectedDevices) {
      stats[device.type] = (stats[device.type] ?? 0) + 1;
    }
    return stats;
  }

  /// 是否需要完善资料
  bool get needsProfileCompletion =>
      userProfile == null || !userProfile!.isProfileComplete;

  /// 获取完成度百分比
  double get completionPercentage {
    if (userProfile == null) return 0.0;

    int completedFields = 0;
    int totalFields = 6; // name, phone, email, gender, birthDate, address

    if (userProfile!.name.isNotEmpty) completedFields++;
    if (userProfile!.phone.isNotEmpty) completedFields++;
    if (userProfile!.email?.isNotEmpty == true) completedFields++;
    if (userProfile!.gender != null) completedFields++;
    if (userProfile!.birthDate != null) completedFields++;
    if (userProfile!.address?.isNotEmpty == true) completedFields++;

    return completedFields / totalFields;
  }

  /// 获取最近活跃的设备
  List<ConnectedDeviceEntity> get recentlyActiveDevices {
    final activeDevices = connectedDevices
        .where((device) => device.status.isActive && device.lastSyncAt != null)
        .toList();

    activeDevices.sort((a, b) =>
        b.lastSyncAt!.compareTo(a.lastSyncAt!));

    return activeDevices.take(3).toList();
  }
}
