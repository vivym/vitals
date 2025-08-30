import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/auth/presentation/providers/auth_providers.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource_impl.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource_mock.dart';
import 'package:vitals/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/domain/usecases/get_reports_usecase.dart';

part 'reports_providers.g.dart';

/// 远程数据源提供者
@riverpod
ReportsRemoteDataSource reportsRemoteDataSource(ReportsRemoteDataSourceRef ref) {
  return ReportsRemoteDataSourceMock();
}

/// 本地数据源提供者
@riverpod
ReportsLocalDataSource reportsLocalDataSource(ReportsLocalDataSourceRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return ReportsLocalDataSourceImpl(sharedPreferences);
}

/// 仓库提供者
@riverpod
ReportsRepository reportsRepository(ReportsRepositoryRef ref) {
  final remoteDataSource = ref.watch(reportsRemoteDataSourceProvider);
  final localDataSource = ref.watch(reportsLocalDataSourceProvider);
  return ReportsRepositoryImpl(remoteDataSource, localDataSource);
}

/// 获取报告用例提供者
@riverpod
GetReportsUseCase getReportsUseCase(GetReportsUseCaseRef ref) {
  return GetReportsUseCase();
}

/// 分享报告用例提供者
@riverpod
class ShareReportUseCase extends _$ShareReportUseCase {
  @override
  Future<void> build() async {
    throw UnimplementedError();
  }

  Future<void> execute(String reportId, String method) async {
    // TODO: 实现分享报告逻辑
    throw UnimplementedError();
  }
}

/// 标记报告已读用例提供者
@riverpod
class MarkReportAsReadUseCase extends _$MarkReportAsReadUseCase {
  @override
  Future<void> build() async {
    throw UnimplementedError();
  }

  Future<void> execute(String reportId) async {
    // TODO: 实现标记已读逻辑
    throw UnimplementedError();
  }
}

/// 请求生成报告用例提供者
@riverpod
class RequestReportGenerationUseCase extends _$RequestReportGenerationUseCase {
  @override
  Future<void> build() async {
    throw UnimplementedError();
  }

  Future<void> execute(String patientId, String type) async {
    // TODO: 实现请求生成报告逻辑
    throw UnimplementedError();
  }
}
