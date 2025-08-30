import 'package:vitals/core/errors/app_error.dart';
import '../repositories/auth_repository.dart';

/// 检查患者签约状态用例接口
abstract class CheckPatientSignedUseCase {
  Future<Result<bool, AppError>> execute();
}

/// 检查患者签约状态用例实现
class CheckPatientSignedUseCaseImpl implements CheckPatientSignedUseCase {
  final AuthRepository _authRepository;

  CheckPatientSignedUseCaseImpl(this._authRepository);

  @override
  Future<Result<bool, AppError>> execute() async {
    try {
      return await _authRepository.hasSignedPatient();
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '检查患者签约状态时发生未知错误: $e', cause: e),
      );
    }
  }
}
