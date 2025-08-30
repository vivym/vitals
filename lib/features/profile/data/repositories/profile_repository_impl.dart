import '../../../../core/errors/app_error.dart';
import '../datasources/profile_remote_datasource.dart';
import '../datasources/profile_local_datasource.dart';
import '../mappers/profile_mappers.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/entities/connected_device_entity.dart';
import '../../domain/entities/app_settings_entity.dart';
import '../../domain/repositories/profile_repository.dart';

/// Profile仓库实现
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;

  ProfileRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<ProfileEntity, AppError>> getProfile(String userId) async {
    try {
      // 先尝试从本地缓存获取
      final cachedProfile = await _localDataSource.getCachedUserProfile();
      final cachedDevices = await _localDataSource.getCachedConnectedDevices();
      final cachedSettings = await _localDataSource.getCachedAppSettings();

      if (cachedProfile != null && cachedDevices != null && cachedSettings != null) {
        final profileEntity = ProfileEntity(
          userProfile: ProfileMappers.userProfileModelToEntity(cachedProfile),
          connectedDevices: cachedDevices.map(ProfileMappers.connectedDeviceModelToEntity).toList(),
          settings: ProfileMappers.appSettingsModelToEntity(cachedSettings),
          lastUpdatedAt: DateTime.now(),
        );
        return Result.success(profileEntity);
      }

      // 从远程获取数据
      final profile = await _remoteDataSource.getUserProfile();
      final devices = await _remoteDataSource.getConnectedDevices();
      final settings = await _remoteDataSource.getAppSettings();

      // 缓存数据
      await _localDataSource.cacheUserProfile(profile);
      await _localDataSource.cacheConnectedDevices(devices);
      await _localDataSource.cacheAppSettings(settings);

      final profileEntity = ProfileEntity(
        userProfile: ProfileMappers.userProfileModelToEntity(profile),
        connectedDevices: devices.map(ProfileMappers.connectedDeviceModelToEntity).toList(),
        settings: ProfileMappers.appSettingsModelToEntity(settings),
        lastUpdatedAt: DateTime.now(),
      );

      return Result.success(profileEntity);
    } catch (e) {
      return Result.failure(AppError.network(message: '获取个人资料失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<UserProfileEntity, AppError>> getUserProfile(String userId) async {
    try {
      final cachedProfile = await _localDataSource.getCachedUserProfile();
      if (cachedProfile != null) {
        return Result.success(ProfileMappers.userProfileModelToEntity(cachedProfile));
      }

      final profile = await _remoteDataSource.getUserProfile();
      await _localDataSource.cacheUserProfile(profile);

      return Result.success(ProfileMappers.userProfileModelToEntity(profile));
    } catch (e) {
      return Result.failure(AppError.network(message: '获取用户资料失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<UserProfileEntity, AppError>> updateUserProfile(
    String userId,
    UserProfileEntity profile,
  ) async {
    try {
      final profileModel = ProfileMappers.userProfileEntityToModel(profile);
      final updatedProfile = await _remoteDataSource.updateUserProfile(profileModel);
      await _localDataSource.cacheUserProfile(updatedProfile);

      return Result.success(ProfileMappers.userProfileModelToEntity(updatedProfile));
    } catch (e) {
      return Result.failure(AppError.network(message: '更新用户资料失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<List<ConnectedDeviceEntity>, AppError>> getConnectedDevices(String userId) async {
    try {
      final cachedDevices = await _localDataSource.getCachedConnectedDevices();
      if (cachedDevices != null) {
        return Result.success(
          cachedDevices.map(ProfileMappers.connectedDeviceModelToEntity).toList(),
        );
      }

      final devices = await _remoteDataSource.getConnectedDevices();
      await _localDataSource.cacheConnectedDevices(devices);

      return Result.success(
        devices.map(ProfileMappers.connectedDeviceModelToEntity).toList(),
      );
    } catch (e) {
      return Result.failure(AppError.network(message: '获取连接设备失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<ConnectedDeviceEntity, AppError>> connectDevice(
    String userId,
    ConnectedDeviceEntity device,
  ) async {
    try {
      final deviceModel = ProfileMappers.connectedDeviceEntityToModel(device);
      final connectedDevice = await _remoteDataSource.connectDevice(deviceModel);

      // 更新缓存
      final cachedDevices = await _localDataSource.getCachedConnectedDevices() ?? [];
      final updatedDevices = [...cachedDevices, connectedDevice];
      await _localDataSource.cacheConnectedDevices(updatedDevices);

      return Result.success(ProfileMappers.connectedDeviceModelToEntity(connectedDevice));
    } catch (e) {
      return Result.failure(AppError.network(message: '连接设备失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void, AppError>> disconnectDevice(String userId, String deviceId) async {
    try {
      await _remoteDataSource.disconnectDevice(deviceId);

      // 更新缓存
      final cachedDevices = await _localDataSource.getCachedConnectedDevices() ?? [];
      final updatedDevices = cachedDevices.where((device) => device.id != deviceId).toList();
      await _localDataSource.cacheConnectedDevices(updatedDevices);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '断开设备连接失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void, AppError>> syncDeviceData(String userId, String deviceId) async {
    try {
      await _remoteDataSource.syncDeviceData(deviceId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '同步设备数据失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<AppSettingsEntity, AppError>> getAppSettings(String userId) async {
    try {
      final cachedSettings = await _localDataSource.getCachedAppSettings();
      if (cachedSettings != null) {
        return Result.success(ProfileMappers.appSettingsModelToEntity(cachedSettings));
      }

      final settings = await _remoteDataSource.getAppSettings();
      await _localDataSource.cacheAppSettings(settings);

      return Result.success(ProfileMappers.appSettingsModelToEntity(settings));
    } catch (e) {
      return Result.failure(AppError.network(message: '获取应用设置失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<AppSettingsEntity, AppError>> updateAppSettings(
    String userId,
    AppSettingsEntity settings,
  ) async {
    try {
      final settingsModel = ProfileMappers.appSettingsEntityToModel(settings);
      final updatedSettings = await _remoteDataSource.updateAppSettings(settingsModel);
      await _localDataSource.cacheAppSettings(updatedSettings);

      return Result.success(ProfileMappers.appSettingsModelToEntity(updatedSettings));
    } catch (e) {
      return Result.failure(AppError.network(message: '更新应用设置失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void, AppError>> backupUserData(String userId) async {
    try {
      await _remoteDataSource.backupUserData(userId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '备份用户数据失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void, AppError>> restoreUserData(String userId, String backupId) async {
    try {
      await _remoteDataSource.restoreUserData(userId, backupId);
      // 清除本地缓存，强制重新获取
      await _localDataSource.clearCache();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '恢复用户数据失败: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void, AppError>> deleteUserAccount(String userId) async {
    try {
      await _remoteDataSource.deleteUserAccount(userId);
      await _localDataSource.clearCache();
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '删除用户账户失败: ${e.toString()}'));
    }
  }
}

