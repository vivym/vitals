import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_device_entity.freezed.dart';

/// 设备类型枚举
enum DeviceType {
  bloodPressureMonitor,
  glucoseMeter,
  smartWatch,
  fitnessTracker,
  smartScale,
  other;

  String get label {
    switch (this) {
      case DeviceType.bloodPressureMonitor:
        return '血压计';
      case DeviceType.glucoseMeter:
        return '血糖仪';
      case DeviceType.smartWatch:
        return '智能手表';
      case DeviceType.fitnessTracker:
        return '运动手环';
      case DeviceType.smartScale:
        return '智能体重秤';
      case DeviceType.other:
        return '其他设备';
    }
  }

  String get icon {
    switch (this) {
      case DeviceType.bloodPressureMonitor:
        return '🩺';
      case DeviceType.glucoseMeter:
        return '🩸';
      case DeviceType.smartWatch:
        return '⌚';
      case DeviceType.fitnessTracker:
        return '📱';
      case DeviceType.smartScale:
        return '⚖️';
      case DeviceType.other:
        return '📱';
    }
  }
}

/// 设备状态枚举
enum DeviceStatus {
  connected,
  disconnected,
  connecting,
  error;

  String get label {
    switch (this) {
      case DeviceStatus.connected:
        return '已连接';
      case DeviceStatus.disconnected:
        return '未连接';
      case DeviceStatus.connecting:
        return '连接中';
      case DeviceStatus.error:
        return '连接异常';
    }
  }

  bool get isActive => this == DeviceStatus.connected;
}

/// 连接设备领域实体
@freezed
abstract class ConnectedDeviceEntity with _$ConnectedDeviceEntity {
  const factory ConnectedDeviceEntity({
    required String id,
    required String name,
    required DeviceType type,
    required DeviceStatus status,
    String? brand,
    String? model,
    String? macAddress,
    DateTime? lastSyncAt,
    DateTime? connectedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ConnectedDeviceEntity;

  const ConnectedDeviceEntity._();

  /// 获取设备显示名称
  String get displayName {
    if (brand != null && model != null) {
      return '$brand $model';
    }
    return name;
  }

  /// 是否可以同步数据
  bool get canSync => status.isActive && lastSyncAt != null;

  /// 获取同步状态描述
  String get syncStatusDescription {
    if (!status.isActive) return '设备未连接';
    if (lastSyncAt == null) return '从未同步';

    final now = DateTime.now();
    final diff = now.difference(lastSyncAt!);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}分钟前同步';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}小时前同步';
    } else {
      return '${diff.inDays}天前同步';
    }
  }
}
