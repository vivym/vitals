import 'package:vitals/core/errors/app_error.dart';
import '../entities/patient_entity.dart';
import '../repositories/auth_repository.dart';

/// 患者签约用例接口
abstract class SignPatientUseCase {
  Future<Result<PatientEntity, AppError>> execute(SignPatientRequest request);
}

/// 患者签约用例实现
class SignPatientUseCaseImpl implements SignPatientUseCase {
  final AuthRepository _authRepository;

  SignPatientUseCaseImpl(this._authRepository);

  @override
  Future<Result<PatientEntity, AppError>> execute(SignPatientRequest request) async {
    try {
      // 验证患者数据
      final validationError = _validatePatientData(request);
      if (validationError != null) {
        return Result.failure(validationError);
      }

      // 调用仓库进行患者签约
      return await _authRepository.signPatient(request);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '患者签约过程中发生未知错误: $e', cause: e),
      );
    }
  }

  /// 验证患者数据
  AppError? _validatePatientData(SignPatientRequest request) {
    // 验证姓名
    if (!PatientEntity.isValidName(request.name)) {
      return const AppError.validation(field: 'name', message: '请输入有效的姓名');
    }

    // 验证身份证号
    if (!PatientEntity.isValidIdNumber(request.idNumber)) {
      return const AppError.validation(field: 'idNumber', message: '请输入有效的身份证号');
    }

    // 验证手机号
    if (!PatientEntity.isValidPhone(request.phone)) {
      return const AppError.validation(field: 'phone', message: '请输入有效的手机号');
    }

    // 验证出生日期
    final now = DateTime.now();
    if (request.birthDate.isAfter(now)) {
      return const AppError.validation(field: 'birthDate', message: '出生日期不能为未来时间');
    }

    final age = now.year - request.birthDate.year;
    if (age > 150) {
      return const AppError.validation(field: 'birthDate', message: '请输入有效的出生日期');
    }

    return null;
  }
}
