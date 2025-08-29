import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/patient.dart';

/// 创建患者用例
/// 包含患者创建的业务逻辑和验证规则
abstract class CreatePatientUseCase {
  /// 执行创建患者
  ///
  /// [request] 患者创建请求
  Future<Result<Patient, AppError>> execute(CreatePatientRequest request);
}
