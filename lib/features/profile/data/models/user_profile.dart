import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

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

/// 用户资料（扩展基础User模型）
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String name,
    required String phone,
    String? email,
    String? avatarUrl,
    Gender? gender,
    DateTime? birthDate,
    String? address,
    String? emergencyContact,
    String? emergencyContactPhone,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  const UserProfile._();

  int? get age {
    if (birthDate == null) return null;
    final now = DateTime.now();
    int age = now.year - birthDate!.year;
    if (now.month < birthDate!.month ||
        (now.month == birthDate!.month && now.day < birthDate!.day)) {
      age--;
    }
    return age;
  }
}
