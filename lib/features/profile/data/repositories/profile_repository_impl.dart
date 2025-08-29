import 'dart:io';
import 'package:vitals/core/errors/app_error.dart';
import '../datasources/profile_remote_datasource.dart';
import '../datasources/profile_local_datasource.dart';
import '../models/user_profile.dart';
import '../models/connected_device.dart';
import '../models/my_service.dart';
import '../models/medication_reminder.dart';
import '../models/app_settings.dart';
import '../models/favorite_item.dart';
import '../models/feedback_item.dart';
import '../../domain/repositories/profile_repository.dart';

/// 个人中心仓库实现
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;

  ProfileRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<UserProfile, AppError>> getUserProfile({bool forceRefresh = false}) async {
    try {
      if (!forceRefresh) {
        final cachedProfile = await _localDataSource.getCachedUserProfile();
        if (cachedProfile != null) {
          return Result.success(cachedProfile);
        }
      }

      final profile = await _remoteDataSource.getUserProfile();
      await _localDataSource.cacheUserProfile(profile);
      return Result.success(profile);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<UserProfile, AppError>> updateUserProfile(UserProfile profile) async {
    try {
      final updatedProfile = await _remoteDataSource.updateUserProfile(profile);
      await _localDataSource.cacheUserProfile(updatedProfile);
      return Result.success(updatedProfile);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<String, AppError>> uploadAvatar(File avatarFile) async {
    try {
      final avatarUrl = await _remoteDataSource.uploadAvatar(avatarFile);
      return Result.success(avatarUrl);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<List<ConnectedDevice>, AppError>> getConnectedDevices() async {
    try {
      final devices = await _remoteDataSource.getConnectedDevices();
      return Result.success(devices);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<ConnectedDevice, AppError>> connectDevice(DeviceType type, Map<String, dynamic> config) async {
    try {
      final device = await _remoteDataSource.connectDevice(type, config);
      return Result.success(device);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<void, AppError>> disconnectDevice(String deviceId) async {
    try {
      await _remoteDataSource.disconnectDevice(deviceId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<List<MyService>, AppError>> getMyServices() async {
    try {
      final services = await _remoteDataSource.getMyServices();
      return Result.success(services);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<List<MedicationReminder>, AppError>> getMedicationReminders(String patientId) async {
    try {
      final reminders = await _remoteDataSource.getMedicationReminders(patientId);
      return Result.success(reminders);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<MedicationReminder, AppError>> createMedicationReminder(MedicationReminder reminder) async {
    try {
      final createdReminder = await _remoteDataSource.createMedicationReminder(reminder);
      return Result.success(createdReminder);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<void, AppError>> deleteMedicationReminder(String reminderId) async {
    try {
      await _remoteDataSource.deleteMedicationReminder(reminderId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<List<FavoriteItem>, AppError>> getFavorites() async {
    try {
      final favorites = await _remoteDataSource.getFavorites();
      return Result.success(favorites);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<void, AppError>> addToFavorites(String contentId, FavoriteType type) async {
    try {
      await _remoteDataSource.addToFavorites(contentId, type);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<void, AppError>> removeFromFavorites(String favoriteId) async {
    try {
      await _remoteDataSource.removeFromFavorites(favoriteId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<void, AppError>> submitFeedback(FeedbackItem feedback) async {
    try {
      await _remoteDataSource.submitFeedback(feedback);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<AppSettings, AppError>> getAppSettings() async {
    try {
      final settings = await _localDataSource.getAppSettings() ?? const AppSettings();
      return Result.success(settings);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<void, AppError>> saveAppSettings(AppSettings settings) async {
    try {
      await _localDataSource.saveAppSettings(settings);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString()));
    }
  }
}
