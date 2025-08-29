// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Patient _$PatientFromJson(Map<String, dynamic> json) => _Patient(
  id: json['id'] as String,
  name: json['name'] as String,
  idNumber: json['id_number'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: DateTime.parse(json['birth_date'] as String),
  phone: json['phone'] as String,
  medicalRecordNumber: json['medical_record_number'] as String?,
  emergencyContact: json['emergency_contact'] as String?,
  emergencyContactPhone: json['emergency_contact_phone'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PatientToJson(_Patient instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'id_number': instance.idNumber,
  'gender': _$GenderEnumMap[instance.gender]!,
  'birth_date': instance.birthDate.toIso8601String(),
  'phone': instance.phone,
  'medical_record_number': instance.medicalRecordNumber,
  'emergency_contact': instance.emergencyContact,
  'emergency_contact_phone': instance.emergencyContactPhone,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

const _$GenderEnumMap = {Gender.male: 1, Gender.female: 2, Gender.other: 3};

_CreatePatientRequest _$CreatePatientRequestFromJson(
  Map<String, dynamic> json,
) => _CreatePatientRequest(
  name: json['name'] as String,
  idNumber: json['id_number'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  birthDate: DateTime.parse(json['birth_date'] as String),
  phone: json['phone'] as String,
  medicalRecordNumber: json['medical_record_number'] as String?,
  emergencyContact: json['emergency_contact'] as String?,
  emergencyContactPhone: json['emergency_contact_phone'] as String?,
);

Map<String, dynamic> _$CreatePatientRequestToJson(
  _CreatePatientRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'id_number': instance.idNumber,
  'gender': _$GenderEnumMap[instance.gender]!,
  'birth_date': instance.birthDate.toIso8601String(),
  'phone': instance.phone,
  'medical_record_number': instance.medicalRecordNumber,
  'emergency_contact': instance.emergencyContact,
  'emergency_contact_phone': instance.emergencyContactPhone,
};
