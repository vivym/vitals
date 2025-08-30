import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitals/features/auth/data/models/user.dart';
import 'package:vitals/features/auth/data/models/patient.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

/// 登录请求模型
@freezed
abstract class LoginRequest with _$LoginRequest {
  const LoginRequest._();

  const factory LoginRequest({
    required String phone,
    @JsonKey(name: 'agreed_to_terms') @Default(true) bool agreedToTerms,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

/// 登录响应模型
@freezed
abstract class LoginResponse with _$LoginResponse {
  const LoginResponse._();

  const factory LoginResponse({
    required String token,
    required User user,
    Patient? patient,  // 改为单个患者，可为空
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}


