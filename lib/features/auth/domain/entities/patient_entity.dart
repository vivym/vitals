/// 性别枚举
enum Gender {
  male(1, '男'),
  female(2, '女'),
  other(3, '其他');

  const Gender(this.value, this.label);
  final int value;
  final String label;
}

/// 患者领域实体
/// 不依赖任何外部框架的纯领域对象
class PatientEntity {
  final String id;
  final String name;
  final String idNumber;
  final Gender gender;
  final DateTime birthDate;
  final String phone;
  final String? medicalRecordNumber;
  final String? emergencyContact;
  final String? emergencyContactPhone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PatientEntity({
    required this.id,
    required this.name,
    required this.idNumber,
    required this.gender,
    required this.birthDate,
    required this.phone,
    this.medicalRecordNumber,
    this.emergencyContact,
    this.emergencyContactPhone,
    this.createdAt,
    this.updatedAt,
  });

  /// 验证身份证号格式
  static bool isValidIdNumber(String idNumber) {
    if (idNumber.length != 18) return false;
    // 前17位必须是数字，最后一位可以是数字或X
    return RegExp(r'^\d{17}[\dX]$').hasMatch(idNumber);
  }

  /// 验证手机号格式
  static bool isValidPhone(String phone) {
    if (phone.length != 11) return false;
    return RegExp(r'^\d{11}$').hasMatch(phone);
  }

  /// 验证姓名格式
  static bool isValidName(String name) {
    return name.trim().isNotEmpty;
  }

  /// 计算年龄
  int get age {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// 是否有紧急联系人
  bool get hasEmergencyContact {
    return emergencyContact != null &&
        emergencyContact!.isNotEmpty &&
        emergencyContactPhone != null &&
        emergencyContactPhone!.isNotEmpty;
  }

  /// 资料是否完整
  bool get hasCompleteProfile {
    return hasEmergencyContact;
  }

  /// 获取显示名称
  String get displayName {
    return '$name (${gender.label})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PatientEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'PatientEntity(id: $id, name: $name, idNumber: $idNumber)';
  }
}
