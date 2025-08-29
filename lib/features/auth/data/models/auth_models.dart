import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
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
    @Default([]) List<Patient> patients,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

/// 认证状态模型
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default([]) List<Patient> patients,
    String? token,
    @Default(false) bool isAuthenticated,
    @Default(false) bool isLoading,
    @Default(false) bool hasAgreedToTerms,
    AppError? error,
  }) = _AuthState;

  /// 便利方法
  const AuthState._();

  bool get hasError => error != null;
  bool get isReady => !isLoading && error == null;
  bool get canLogin => hasAgreedToTerms && isReady;
}

/// 表单验证状态
@freezed
abstract class FormValidationState with _$FormValidationState {
  const FormValidationState._();

  const factory FormValidationState({
    @Default({}) Map<String, String> errors,
    @Default(false) bool isValid,
  }) = _FormValidationState;
}

/// 患者表单状态
@freezed
abstract class PatientFormState with _$PatientFormState {
  const PatientFormState._();

  const factory PatientFormState({
    String? name,
    String? idNumber,
    Gender? gender,
    DateTime? birthDate,
    String? phone,
    String? medicalRecordNumber,
    String? emergencyContact,
    String? emergencyContactPhone,
    @Default(FormValidationState()) FormValidationState validationState,
    @Default(false) bool isSubmitting,
    AppError? generalError,
  }) = _PatientFormState;
}
