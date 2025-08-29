// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConnectedDevice _$ConnectedDeviceFromJson(Map<String, dynamic> json) =>
    _ConnectedDevice(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
      status: $enumDecode(_$DeviceStatusEnumMap, json['status']),
      connectedAt: json['connected_at'] == null
          ? null
          : DateTime.parse(json['connected_at'] as String),
      lastSync: json['last_sync'] == null
          ? null
          : DateTime.parse(json['last_sync'] as String),
      settings: json['settings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ConnectedDeviceToJson(_ConnectedDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'status': _$DeviceStatusEnumMap[instance.status]!,
      'connected_at': instance.connectedAt?.toIso8601String(),
      'last_sync': instance.lastSync?.toIso8601String(),
      'settings': instance.settings,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.huaweiHealth: 1,
  DeviceType.xiaomiHealth: 2,
  DeviceType.appleHealth: 3,
  DeviceType.bloodPressureMonitor: 4,
  DeviceType.glucoseMeter: 5,
};

const _$DeviceStatusEnumMap = {
  DeviceStatus.connected: 1,
  DeviceStatus.disconnected: 2,
  DeviceStatus.syncing: 3,
  DeviceStatus.error: 4,
};
