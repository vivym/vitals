// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
  birthDate: json['birthDate'] == null
      ? null
      : DateTime.parse(json['birthDate'] as String),
  address: json['address'] as String?,
  emergencyContact: json['emergencyContact'] as String?,
  emergencyContactPhone: json['emergencyContactPhone'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'gender': _$GenderEnumMap[instance.gender],
      'birthDate': instance.birthDate?.toIso8601String(),
      'address': instance.address,
      'emergencyContact': instance.emergencyContact,
      'emergencyContactPhone': instance.emergencyContactPhone,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$GenderEnumMap = {Gender.male: 1, Gender.female: 2, Gender.other: 3};
