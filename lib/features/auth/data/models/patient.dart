import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

/// 性别枚举
@JsonEnum(valueField: 'value')
enum Gender {
  male(1, '男'),
  female(2, '女'),
  other(3, '其他');

  const Gender(this.value, this.label);
  final int value;
  final String label;
}

/// 患者实体模型
@freezed
abstract class Patient with _$Patient {
  const Patient._();

  const factory Patient({
    required String id,
    required String name,
    @JsonKey(name: 'id_number') required String idNumber,
    required Gender gender,
    @JsonKey(name: 'birth_date') required DateTime birthDate,
    required String phone,
    @JsonKey(name: 'medical_record_number') String? medicalRecordNumber,
    @JsonKey(name: 'emergency_contact') String? emergencyContact,
    @JsonKey(name: 'emergency_contact_phone') String? emergencyContactPhone,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
}

/// 患者签约请求模型
@freezed
abstract class SignPatientRequest with _$SignPatientRequest {
  const SignPatientRequest._();

  const factory SignPatientRequest({
    required String name,
    @JsonKey(name: 'id_number') required String idNumber,
    required Gender gender,
    @JsonKey(name: 'birth_date') required DateTime birthDate,
    required String phone,
    @JsonKey(name: 'medical_record_number') String? medicalRecordNumber,
    @JsonKey(name: 'emergency_contact') String? emergencyContact,
    @JsonKey(name: 'emergency_contact_phone') String? emergencyContactPhone,
  }) = _SignPatientRequest;

  factory SignPatientRequest.fromJson(Map<String, dynamic> json) =>
      _$SignPatientRequestFromJson(json);
}
