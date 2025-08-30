import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

/// 性别枚举
enum Gender {
  male,
  female,
  other;

  String get label {
    switch (this) {
      case Gender.male:
        return '男';
      case Gender.female:
        return '女';
      case Gender.other:
        return '其他';
    }
  }
}

/// 用户资料领域实体
@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfileEntity;

  const UserProfileEntity._();

  /// 计算年龄
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

  /// 获取显示名称
  String get displayName => name.isEmpty ? phone : name;

  /// 是否完善了基本信息
  bool get isProfileComplete =>
    name.isNotEmpty &&
    gender != null &&
    birthDate != null;
}
