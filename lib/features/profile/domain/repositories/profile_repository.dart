import '../../../../core/errors/app_error.dart';
import '../entities/profile_entity.dart';
import '../entities/user_profile_entity.dart';
import '../entities/connected_device_entity.dart';
import '../entities/app_settings_entity.dart';

/// Profile仓库接口
abstract class ProfileRepository {
  /// 获取完整的个人资料数据
  Future<Result<ProfileEntity, AppError>> getProfile(String userId);

  /// 获取用户基本信息
  Future<Result<UserProfileEntity, AppError>> getUserProfile(String userId);

  /// 更新用户基本信息
  Future<Result<UserProfileEntity, AppError>> updateUserProfile(
    String userId,
    UserProfileEntity profile,
  );

  /// 获取连接的设备列表
  Future<Result<List<ConnectedDeviceEntity>, AppError>> getConnectedDevices(String userId);

  /// 连接新设备
  Future<Result<ConnectedDeviceEntity, AppError>> connectDevice(
    String userId,
    ConnectedDeviceEntity device,
  );

  /// 断开设备连接
  Future<Result<void, AppError>> disconnectDevice(String userId, String deviceId);

  /// 同步设备数据
  Future<Result<void, AppError>> syncDeviceData(String userId, String deviceId);

  /// 获取应用设置
  Future<Result<AppSettingsEntity, AppError>> getAppSettings(String userId);

  /// 更新应用设置
  Future<Result<AppSettingsEntity, AppError>> updateAppSettings(
    String userId,
    AppSettingsEntity settings,
  );

  /// 备份用户数据
  Future<Result<void, AppError>> backupUserData(String userId);

  /// 恢复用户数据
  Future<Result<void, AppError>> restoreUserData(String userId, String backupId);

  /// 删除用户账户
  Future<Result<void, AppError>> deleteUserAccount(String userId);
}