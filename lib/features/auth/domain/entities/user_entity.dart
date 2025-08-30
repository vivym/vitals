/// 用户领域实体
/// 不依赖任何外部框架的纯领域对象
class UserEntity {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? avatarUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  /// 验证手机号格式
  static bool isValidPhone(String phone) {
    if (phone.length != 11) return false;
    return RegExp(r'^\d{11}$').hasMatch(phone);
  }

  /// 验证邮箱格式
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    return RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);
  }

  /// 验证姓名格式
  static bool isValidName(String name) {
    return name.trim().isNotEmpty;
  }

  /// 是否完整填写了资料
  bool get hasCompleteProfile {
    return email != null && email!.isNotEmpty;
  }

  /// 获取显示名称
  String get displayName => name;

  /// 获取头像URL或默认值
  String get avatarUrlOrDefault {
    return avatarUrl ?? 'assets/images/default_avatar.png';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, phone: $phone)';
  }
}
