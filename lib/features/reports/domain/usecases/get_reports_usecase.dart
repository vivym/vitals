import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/presentation/providers/reports_providers.dart';

part 'get_reports_usecase.g.dart';

@riverpod
class GetReportsUseCase extends _$GetReportsUseCase {
  @override
  Future<Result<List<HealthReport>, AppError>> build() async {
    throw UnimplementedError();
  }

  Future<Result<List<HealthReport>, AppError>> execute(
    String patientId, {
    bool forceRefresh = false,
  }) async {
    final repository = ref.read(reportsRepositoryProvider);
    return await repository.getReports(patientId, forceRefresh: forceRefresh);
  }
}
