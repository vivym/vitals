import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/presentation/providers/reports_providers.dart';

part 'request_report_generation_usecase.g.dart';

/// 请求生成报告用例
@riverpod
class RequestReportGenerationUseCase extends _$RequestReportGenerationUseCase {
  @override
  Future<Result<void, AppError>> build() async {
    throw UnimplementedError();
  }

  /// 执行请求生成报告
  Future<Result<void, AppError>> execute(String patientId, ReportType type) async {
    final repository = ref.read(reportsRepositoryProvider);
    return await repository.requestReportGeneration(patientId, type);
  }
}
