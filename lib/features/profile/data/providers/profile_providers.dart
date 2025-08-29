import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../datasources/profile_remote_datasource.dart';
import '../datasources/profile_remote_datasource_mock.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_local_datasource_impl.dart';
import '../repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

part 'profile_providers.g.dart';

/// 个人中心远程数据源提供者
@riverpod
ProfileRemoteDataSource profileRemoteDataSource(ProfileRemoteDataSourceRef ref) {
  return ProfileRemoteDataSourceMock();
}

/// 个人中心本地数据源提供者
@riverpod
ProfileLocalDataSource profileLocalDataSource(ProfileLocalDataSourceRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final secureStorage = ref.watch(flutterSecureStorageProvider);

  return ProfileLocalDataSourceImpl(prefs, secureStorage);
}

/// 个人中心仓库提供者
@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final remoteDataSource = ref.watch(profileRemoteDataSourceProvider);
  final localDataSource = ref.watch(profileLocalDataSourceProvider);

  return ProfileRepositoryImpl(remoteDataSource, localDataSource);
}
