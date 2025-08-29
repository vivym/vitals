// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyService _$MyServiceFromJson(Map<String, dynamic> json) => _MyService(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$ServiceTypeEnumMap, json['type']),
  status: $enumDecode(_$ServiceStatusEnumMap, json['status']),
  iconUrl: json['iconUrl'] as String?,
  subscribedAt: json['subscribed_at'] == null
      ? null
      : DateTime.parse(json['subscribed_at'] as String),
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
);

Map<String, dynamic> _$MyServiceToJson(_MyService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$ServiceTypeEnumMap[instance.type]!,
      'status': _$ServiceStatusEnumMap[instance.status]!,
      'iconUrl': instance.iconUrl,
      'subscribed_at': instance.subscribedAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
    };

const _$ServiceTypeEnumMap = {
  ServiceType.consultation: 1,
  ServiceType.followUp: 2,
  ServiceType.rehabilitation: 3,
  ServiceType.nutrition: 4,
  ServiceType.medication: 5,
};

const _$ServiceStatusEnumMap = {
  ServiceStatus.active: 1,
  ServiceStatus.expired: 2,
  ServiceStatus.suspended: 3,
};
