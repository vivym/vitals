import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../domain/entities/patient_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_provider.dart';
import 'auth_providers.dart';

part 'patient_sign_form_provider.g.dart';
part 'patient_sign_form_provider.freezed.dart';

/// 表单验证状态
@freezed
abstract class FormValidationState with _$FormValidationState {
  const FormValidationState._();

  const factory FormValidationState({
    @Default({}) Map<String, String> errors,
    @Default(false) bool isValid,
  }) = _FormValidationState;
}

/// 患者签约表单状态
@freezed
abstract class PatientSignFormState with _$PatientSignFormState {
  const PatientSignFormState._();

  const factory PatientSignFormState({
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
  }) = _PatientSignFormState;
}

/// 患者签约表单状态通知器
/// 管理患者签约表单的状态和验证
@riverpod
class PatientSignFormNotifier extends _$PatientSignFormNotifier {
  @override
  PatientSignFormState build() {
    return const PatientSignFormState();
  }

  /// 更新姓名
  void updateName(String name) {
    state = state.copyWith(name: name);
    _validateName(name);
  }

  /// 更新身份证号
  void updateIdNumber(String idNumber) {
    state = state.copyWith(idNumber: idNumber);
    _validateIdNumber(idNumber);
  }

  /// 更新性别
  void updateGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  /// 更新出生日期
  void updateBirthDate(DateTime birthDate) {
    state = state.copyWith(birthDate: birthDate);
    _validateBirthDate(birthDate);
  }

  /// 更新手机号
  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
    _validatePhone(phone);
  }

  /// 更新紧急联系人
  void updateEmergencyContact(String contact) {
    state = state.copyWith(emergencyContact: contact);
  }

  /// 更新紧急联系人电话
  void updateEmergencyContactPhone(String phone) {
    state = state.copyWith(emergencyContactPhone: phone);
    if (phone.isNotEmpty) {
      _validateEmergencyPhone(phone);
    } else {
      _clearFieldError('emergencyContactPhone');
    }
  }

  /// 签约患者
  Future<bool> signPatient() async {
    if (!_validateAllFields()) {
      return false;
    }

    state = state.copyWith(isSubmitting: true);

    final request = SignPatientRequest(
      name: state.name!,
      idNumber: state.idNumber!,
      gender: state.gender!,
      birthDate: state.birthDate!,
      phone: state.phone!,
      medicalRecordNumber: state.medicalRecordNumber,
      emergencyContact: state.emergencyContact,
      emergencyContactPhone: state.emergencyContactPhone,
    );

    final signPatientUseCase = ref.read(signPatientUseCaseProvider);
    final result = await signPatientUseCase.execute(request);

    return result.when(
      success: (patient) {
        // 通知 AuthNotifier 签约成功
        ref.read(authNotifierProvider.notifier).onPatientSigned(patient);

        // 重置表单
        state = const PatientSignFormState();
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isSubmitting: false,
          generalError: error,
        );
        return false;
      },
    );
  }

  /// 重置表单
  void reset() {
    state = const PatientSignFormState();
  }

  /// 清除通用错误
  void clearGeneralError() {
    state = state.copyWith(generalError: null);
  }

  // 私有验证方法
  void _validateName(String name) {
    if (name.trim().isEmpty) {
      _setFieldError('name', '请输入真实姓名');
    } else {
      _clearFieldError('name');
    }
  }

  void _validateIdNumber(String idNumber) {
    final regex = RegExp(r'^\d{17}[\dXx]$');
    if (!regex.hasMatch(idNumber)) {
      _setFieldError('idNumber', '请输入正确的身份证号');
    } else {
      _clearFieldError('idNumber');
    }
  }

  void _validatePhone(String phone) {
    final regex = RegExp(r'^1[3-9]\d{9}$');
    if (!regex.hasMatch(phone)) {
      _setFieldError('phone', '请输入正确的手机号码');
    } else {
      _clearFieldError('phone');
    }
  }

  void _validateEmergencyPhone(String phone) {
    final regex = RegExp(r'^1[3-9]\d{9}$');
    if (!regex.hasMatch(phone)) {
      _setFieldError('emergencyContactPhone', '请输入正确的手机号码');
    } else {
      _clearFieldError('emergencyContactPhone');
    }
  }

  void _validateBirthDate(DateTime birthDate) {
    final now = DateTime.now();
    if (birthDate.isAfter(now)) {
      _setFieldError('birthDate', '请输入正确的出生日期');
    } else {
      final age = now.year - birthDate.year;
      if (age > 150) {
        _setFieldError('birthDate', '请输入正确的出生日期');
      } else {
        _clearFieldError('birthDate');
      }
    }
  }

  bool _validateAllFields() {
    bool isValid = true;

    if (state.name?.trim().isEmpty ?? true) {
      _setFieldError('name', '请输入真实姓名');
      isValid = false;
    }

    if (state.idNumber?.isEmpty ?? true) {
      _setFieldError('idNumber', '请输入身份证号');
      isValid = false;
    }

    if (state.phone?.isEmpty ?? true) {
      _setFieldError('phone', '请输入手机号码');
      isValid = false;
    }

    if (state.birthDate == null) {
      _setFieldError('birthDate', '请选择出生日期');
      isValid = false;
    }

    if (state.gender == null) {
      _setFieldError('gender', '请选择性别');
      isValid = false;
    }

    return isValid && state.validationState.errors.isEmpty;
  }

  void _setFieldError(String field, String message) {
    final newErrors = Map<String, String>.from(state.validationState.errors);
    newErrors[field] = message;
    state = state.copyWith(
      validationState: state.validationState.copyWith(errors: newErrors),
    );
  }

  void _clearFieldError(String field) {
    final newErrors = Map<String, String>.from(state.validationState.errors);
    newErrors.remove(field);
    state = state.copyWith(
      validationState: state.validationState.copyWith(errors: newErrors),
    );
  }
}


