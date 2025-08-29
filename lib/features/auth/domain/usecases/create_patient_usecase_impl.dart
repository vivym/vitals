import 'package:vitals/core/errors/app_error.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/patient.dart';
import 'create_patient_usecase.dart';

/// 创建患者用例实现
/// 包含患者创建的业务逻辑和验证规则
class CreatePatientUseCaseImpl implements CreatePatientUseCase {
  final AuthRepository _repository;

  CreatePatientUseCaseImpl(this._repository);

  @override
  Future<Result<Patient, AppError>> execute(CreatePatientRequest request) async {
    // 业务规则验证
    final validationResult = _validatePatientData(request);
    if (validationResult.isFailure) {
      return validationResult.cast<Patient>();
    }

    return await _repository.createPatient(request);
  }

  Result<void, AppError> _validatePatientData(CreatePatientRequest request) {
    // 姓名验证
    if (request.name.trim().isEmpty) {
      return const Result.failure(
        AppError.validation(field: 'name', message: '请输入真实姓名'),
      );
    }

    // 身份证号验证
    if (!_isValidIdNumber(request.idNumber)) {
      return const Result.failure(
        AppError.validation(field: 'idNumber', message: '请输入正确的身份证号'),
      );
    }

    // 手机号验证
    if (!_isValidPhone(request.phone)) {
      return const Result.failure(
        AppError.validation(field: 'phone', message: '请输入正确的手机号码'),
      );
    }

    // 出生日期验证
    final now = DateTime.now();
    if (request.birthDate.isAfter(now)) {
      return const Result.failure(
        AppError.validation(field: 'birthDate', message: '请输入正确的出生日期'),
      );
    }

    // 年龄验证（不能超过150岁）
    final age = now.year - request.birthDate.year;
    if (age > 150) {
      return const Result.failure(
        AppError.validation(field: 'birthDate', message: '请输入正确的出生日期'),
      );
    }

    return const Result.success(null);
  }

  bool _isValidIdNumber(String idNumber) {
    final regex = RegExp(r'^\d{17}[\dXx]$');
    return regex.hasMatch(idNumber);
  }

  bool _isValidPhone(String phone) {
    final regex = RegExp(r'^1[3-9]\d{9}$');
    return regex.hasMatch(phone);
  }
}
