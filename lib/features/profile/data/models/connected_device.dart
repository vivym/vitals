import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'connected_device.freezed.dart';
part 'connected_device.g.dart';

/// 设备类型枚举
@JsonEnum(valueField: 'value')
enum DeviceType {
  huaweiHealth(1, '华为运动健康', Icons.watch),
  xiaomiHealth(2, '小米运动', Icons.fitness_center),
  appleHealth(3, 'Apple Health', Icons.favorite),
  bloodPressureMonitor(4, '血压计', Icons.monitor_heart),
  glucoseMeter(5, '血糖仪', Icons.water_drop);

  const DeviceType(this.value, this.label, this.icon);
  final int value;
  final String label;
  final IconData icon;
}

/// 设备状态
@JsonEnum(valueField: 'value')
enum DeviceStatus {
  connected(1, '已连接', Colors.green),
  disconnected(2, '未连接', Colors.grey),
  syncing(3, '同步中', Colors.orange),
  error(4, '连接异常', Colors.red);

  const DeviceStatus(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

/// 设备绑定信息
@freezed
abstract class ConnectedDevice with _$ConnectedDevice {
  const factory ConnectedDevice({
    required String id,
    required String name,
    required DeviceType type,
    required DeviceStatus status,
    @JsonKey(name: 'connected_at') DateTime? connectedAt,
    @JsonKey(name: 'last_sync') DateTime? lastSync,
    Map<String, dynamic>? settings,
  }) = _ConnectedDevice;

  factory ConnectedDevice.fromJson(Map<String, dynamic> json) =>
      _$ConnectedDeviceFromJson(json);
}
