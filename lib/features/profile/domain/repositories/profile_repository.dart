import 'dart:io';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/user_profile.dart';
import '../../data/models/connected_device.dart';
import '../../data/models/my_service.dart';
import '../../data/models/medication_reminder.dart';
import '../../data/models/app_settings.dart';
import '../../data/models/favorite_item.dart';
import '../../data/models/feedback_item.dart';

/// 个人中心仓库接口
abstract class ProfileRepository {
  /// 获取用户资料
  Future<Result<UserProfile, AppError>> getUserProfile({bool forceRefresh = false});

  /// 更新用户资料
  Future<Result<UserProfile, AppError>> updateUserProfile(UserProfile profile);

  /// 上传头像
  Future<Result<String, AppError>> uploadAvatar(File avatarFile);

  /// 获取已连接设备
  Future<Result<List<ConnectedDevice>, AppError>> getConnectedDevices();

  /// 连接设备
  Future<Result<ConnectedDevice, AppError>> connectDevice(DeviceType type, Map<String, dynamic> config);

  /// 断开设备连接
  Future<Result<void, AppError>> disconnectDevice(String deviceId);

  /// 获取我的服务
  Future<Result<List<MyService>, AppError>> getMyServices();

  /// 获取用药提醒
  Future<Result<List<MedicationReminder>, AppError>> getMedicationReminders(String patientId);

  /// 创建用药提醒
  Future<Result<MedicationReminder, AppError>> createMedicationReminder(MedicationReminder reminder);

  /// 删除用药提醒
  Future<Result<void, AppError>> deleteMedicationReminder(String reminderId);

  /// 获取收藏内容
  Future<Result<List<FavoriteItem>, AppError>> getFavorites();

  /// 添加到收藏
  Future<Result<void, AppError>> addToFavorites(String contentId, FavoriteType type);

  /// 从收藏中移除
  Future<Result<void, AppError>> removeFromFavorites(String favoriteId);

  /// 提交反馈
  Future<Result<void, AppError>> submitFeedback(FeedbackItem feedback);

  /// 获取应用设置
  Future<Result<AppSettings, AppError>> getAppSettings();

  /// 保存应用设置
  Future<Result<void, AppError>> saveAppSettings(AppSettings settings);
}
