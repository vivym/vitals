import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource_mock.dart';

part 'reports_providers.g.dart';

/// 远程数据源提供者
@riverpod
ReportsRemoteDataSource reportsRemoteDataSource(ReportsRemoteDataSourceRef ref) {
  return ReportsRemoteDataSourceMock();
}

/// 本地数据源提供者
@riverpod
ReportsLocalDataSource reportsLocalDataSource(ReportsLocalDataSourceRef ref) {
  // TODO: 实现真实的本地数据源
  throw UnimplementedError();
}

@riverpod
ReportsRepository reportsRepository(ReportsRepositoryRef ref) {
  final remoteDataSource = ref.watch(reportsRemoteDataSourceProvider);
  final localDataSource = ref.watch(reportsLocalDataSourceProvider);
  return ReportsRepositoryImpl(remoteDataSource, localDataSource);
}
