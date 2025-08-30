import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// 共享用户模型
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String phone,
    String? name,
    String? email,
    String? avatarUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();

  /// 获取显示名称
  String get displayName => name?.isNotEmpty == true ? name! : phone;
}
