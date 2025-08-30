import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/features/auth/presentation/providers/auth_providers.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource_impl.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource_mock.dart';
import 'package:vitals/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';

part 'reports_providers.g.dart';

/// 远程数据源提供者
@riverpod
ReportsRemoteDataSource reportsRemoteDataSource(Ref ref) {
  return ReportsRemoteDataSourceMock();
}

/// 本地数据源提供者
@riverpod
ReportsLocalDataSource reportsLocalDataSource(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return ReportsLocalDataSourceImpl(sharedPreferences);
}

/// 仓库提供者
@riverpod
ReportsRepository reportsRepository(Ref ref) {
  final remoteDataSource = ref.watch(reportsRemoteDataSourceProvider);
  final localDataSource = ref.watch(reportsLocalDataSourceProvider);
  return ReportsRepositoryImpl(remoteDataSource, localDataSource);
}

// UseCase providers 移动到 usecase_providers.dart 文件中
