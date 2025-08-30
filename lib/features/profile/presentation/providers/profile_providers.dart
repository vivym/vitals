import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/update_user_profile_usecase.dart';
import '../../domain/usecases/manage_devices_usecase.dart';
import '../../domain/usecases/manage_app_settings_usecase.dart';
import '../../domain/usecases/backup_restore_usecase.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/datasources/profile_remote_datasource_mock.dart';
import '../../data/datasources/profile_local_datasource.dart';
import '../../data/datasources/profile_local_datasource_impl.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

part 'profile_providers.g.dart';

/// ===== Infrastructure 层 Providers =====

/// 个人中心远程数据源提供者
@riverpod
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) {
  return ProfileRemoteDataSourceMock();
}

/// 个人中心本地数据源提供者
@riverpod
ProfileLocalDataSource profileLocalDataSource(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final secureStorage = ref.watch(flutterSecureStorageProvider);

  return ProfileLocalDataSourceImpl(prefs, secureStorage);
}

/// 个人中心仓库提供者
@riverpod
ProfileRepository profileRepository(Ref ref) {
  final remoteDataSource = ref.watch(profileRemoteDataSourceProvider);
  final localDataSource = ref.watch(profileLocalDataSourceProvider);

  return ProfileRepositoryImpl(remoteDataSource, localDataSource);
}

/// ===== Domain 层 Use Cases =====

/// 获取个人资料用例
@riverpod
GetProfileUsecase getProfileUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileUsecase(repository);
}

/// 更新用户资料用例
@riverpod
UpdateUserProfileUsecase updateUserProfileUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return UpdateUserProfileUsecase(repository);
}

/// 设备管理用例
@riverpod
ManageDevicesUsecase manageDevicesUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ManageDevicesUsecase(repository);
}

/// 应用设置管理用例
@riverpod
ManageAppSettingsUsecase manageAppSettingsUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ManageAppSettingsUsecase(repository);
}

/// 数据备份恢复用例
@riverpod
BackupRestoreUsecase backupRestoreUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return BackupRestoreUsecase(repository);
}
