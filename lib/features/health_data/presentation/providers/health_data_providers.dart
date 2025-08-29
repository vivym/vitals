import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_local_data_source_impl.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_remote_data_source.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_remote_data_source_mock.dart';
import 'package:vitals/features/health_data/data/repositories/health_data_repository_impl.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';

part 'health_data_providers.g.dart';

// 本地数据源提供者
@riverpod
Future<HealthDataLocalDataSourceImpl> healthDataLocalDataSource(
  HealthDataLocalDataSourceRef ref,
) async {
  final prefs = await SharedPreferences.getInstance();
  return HealthDataLocalDataSourceImpl(prefs);
}

// 远程数据源提供者
@riverpod
HealthDataRemoteDataSource healthDataRemoteDataSource(
  HealthDataRemoteDataSourceRef ref,
) {
  return HealthDataRemoteDataSourceMock();
}

// 健康数据仓库提供者
@riverpod
HealthDataRepository healthDataRepository(
  HealthDataRepositoryRef ref,
) {
  final remoteDataSource = ref.watch(healthDataRemoteDataSourceProvider);
  final localDataSource = ref.watch(healthDataLocalDataSourceProvider).value;

  if (localDataSource == null) {
    throw Exception('本地数据源未初始化');
  }

  return HealthDataRepositoryImpl(remoteDataSource, localDataSource);
}


