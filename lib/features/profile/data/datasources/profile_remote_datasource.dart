import 'dart:io';
import '../models/user_profile.dart';
import '../models/connected_device.dart';
import '../models/app_settings.dart';
import '../models/my_service.dart';
import '../models/medication_reminder.dart';
import '../models/favorite_item.dart';
import '../models/feedback_item.dart';

/// 个人中心远程数据源
abstract class ProfileRemoteDataSource {
  Future<UserProfile> getUserProfile();
  Future<UserProfile> updateUserProfile(UserProfile profile);
  Future<String> uploadAvatar(File avatarFile);

  Future<List<ConnectedDevice>> getConnectedDevices();
  Future<ConnectedDevice> connectDevice(ConnectedDevice device);
  Future<void> disconnectDevice(String deviceId);
  Future<void> syncDeviceData(String deviceId);

  Future<AppSettings> getAppSettings();
  Future<AppSettings> updateAppSettings(AppSettings settings);

  Future<void> backupUserData(String userId);
  Future<void> restoreUserData(String userId, String backupId);
  Future<void> deleteUserAccount(String userId);

  Future<List<MyService>> getMyServices();
  Future<List<MedicationReminder>> getMedicationReminders(String patientId);
  Future<MedicationReminder> createMedicationReminder(MedicationReminder reminder);
  Future<void> deleteMedicationReminder(String reminderId);

  Future<List<FavoriteItem>> getFavorites();
  Future<void> addToFavorites(String contentId, FavoriteType type);
  Future<void> removeFromFavorites(String favoriteId);

  Future<void> submitFeedback(FeedbackItem feedback);
}
