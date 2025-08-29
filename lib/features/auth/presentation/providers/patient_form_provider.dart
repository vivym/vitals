import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/auth_models.dart';
import '../../data/models/patient.dart';
import '../../domain/usecases/create_patient_usecase.dart';
import 'auth_provider.dart';
import 'auth_providers.dart';

export 'auth_providers.dart';

part 'patient_form_provider.g.dart';

/// 患者表单状态通知器
/// 管理患者创建表单的状态和验证
@riverpod
class PatientFormNotifier extends _$PatientFormNotifier {
  @override
  PatientFormState build() {
    return const PatientFormState();
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

  /// 创建患者
  Future<bool> createPatient() async {
    if (!_validateAllFields()) {
      return false;
    }

    state = state.copyWith(isSubmitting: true);

    final request = CreatePatientRequest(
      name: state.name!,
      idNumber: state.idNumber!,
      gender: state.gender!,
      birthDate: state.birthDate!,
      phone: state.phone!,
      emergencyContact: state.emergencyContact,
      emergencyContactPhone: state.emergencyContactPhone,
    );

    final createPatientUseCase = ref.read(createPatientUseCaseProvider);
    final result = await createPatientUseCase.execute(request);

    return result.when(
      success: (patient) {
        // 添加患者到认证状态
        ref.read(authNotifierProvider.notifier).addPatient(patient);

        // 重置表单
        state = const PatientFormState();
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
    state = const PatientFormState();
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


