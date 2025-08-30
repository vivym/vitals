import 'dart:io';
import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../models/connected_device.dart';
import '../models/app_settings.dart';
import '../models/my_service.dart';
import '../models/medication_reminder.dart';
import '../models/favorite_item.dart';
import '../models/feedback_item.dart';
import 'profile_remote_datasource.dart';

/// Mock 实现
class ProfileRemoteDataSourceMock implements ProfileRemoteDataSource {
  @override
  Future<UserProfile> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return UserProfile(
      id: 'user_1',
      name: '王高南',
      phone: '13800000000',
      email: 'wanggaonan@example.com',
      avatarUrl: 'https://example.com/avatar.jpg',
      gender: Gender.male,
      birthDate: DateTime(1990, 5, 15),
      address: '北京市朝阳区xxx街道',
      emergencyContact: '李四',
      emergencyContactPhone: '13900000000',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<UserProfile> updateUserProfile(UserProfile profile) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return profile.copyWith(updatedAt: DateTime.now());
  }

  @override
  Future<String> uploadAvatar(File avatarFile) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return 'https://example.com/avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  @override
  Future<List<ConnectedDevice>> getConnectedDevices() async {
    await Future.delayed(const Duration(milliseconds: 600));

    return [
      ConnectedDevice(
        id: 'device_1',
        name: '华为运动健康',
        type: DeviceType.huaweiHealth,
        status: DeviceStatus.connected,
        connectedAt: DateTime.now().subtract(const Duration(days: 10)),
        lastSync: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      ConnectedDevice(
        id: 'device_2',
        name: '小米手环',
        type: DeviceType.xiaomiHealth,
        status: DeviceStatus.disconnected,
        connectedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];
  }

  @override
  Future<ConnectedDevice> connectDevice(ConnectedDevice device) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return device.copyWith(
      id: 'device_${DateTime.now().millisecondsSinceEpoch}',
      status: DeviceStatus.connected,
      connectedAt: DateTime.now(),
    );
  }

  @override
  Future<void> disconnectDevice(String deviceId) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> syncDeviceData(String deviceId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    // Mock sync operation
  }

  @override
  Future<AppSettings> getAppSettings() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return const AppSettings(
      notificationsEnabled: true,
      medicationReminders: true,
      healthDataReminders: true,
      themeMode: ThemeMode.system,
      autoSyncDevices: true,
    );
  }

  @override
  Future<AppSettings> updateAppSettings(AppSettings settings) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return settings.copyWith(
      // Mock update timestamp if needed
    );
  }

  @override
  Future<void> backupUserData(String userId) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    // Mock backup operation
  }

  @override
  Future<void> restoreUserData(String userId, String backupId) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    // Mock restore operation
  }

  @override
  Future<void> deleteUserAccount(String userId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Mock account deletion
  }

  @override
  Future<List<MyService>> getMyServices() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return [
      MyService(
        id: 'service_1',
        name: '在线问诊',
        description: '专业医生在线问诊服务',
        type: ServiceType.consultation,
        status: ServiceStatus.active,
        subscribedAt: DateTime.now().subtract(const Duration(days: 15)),
        expiresAt: DateTime.now().add(const Duration(days: 15)),
      ),
      MyService(
        id: 'service_2',
        name: '随访管理',
        description: '定期随访和健康管理',
        type: ServiceType.followUp,
        status: ServiceStatus.active,
        subscribedAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
    ];
  }

  @override
  Future<List<MedicationReminder>> getMedicationReminders(String patientId) async {
    await Future.delayed(const Duration(milliseconds: 400));

    return [
      MedicationReminder(
        id: 'reminder_1',
        patientId: patientId,
        medicationName: '降压药',
        dosage: '5mg',
        scheduledTimes: [
          const TimeOfDay(hour: 8, minute: 0),
          const TimeOfDay(hour: 20, minute: 0),
        ],
        weekdays: [1, 2, 3, 4, 5, 6, 7], // 每天
        startDate: DateTime.now().subtract(const Duration(days: 7)),
        endDate: DateTime.now().add(const Duration(days: 30)),
        isActive: true,
        notes: '饭后服用',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }

  @override
  Future<MedicationReminder> createMedicationReminder(MedicationReminder reminder) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return reminder.copyWith(
      id: 'reminder_${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<void> deleteMedicationReminder(String reminderId) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<List<FavoriteItem>> getFavorites() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      FavoriteItem(
        id: 'favorite_1',
        contentId: 'content_1',
        type: FavoriteType.article,
        title: '高血压的预防与治疗',
        summary: '详细介绍高血压的预防措施和治疗方法',
        favoritedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      FavoriteItem(
        id: 'favorite_2',
        contentId: 'content_2',
        type: FavoriteType.video,
        title: '健康饮食指南',
        summary: '科学健康的饮食建议',
        favoritedAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];
  }

  @override
  Future<void> addToFavorites(String contentId, FavoriteType type) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Future<void> removeFromFavorites(String favoriteId) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Future<void> submitFeedback(FeedbackItem feedback) async {
    await Future.delayed(const Duration(milliseconds: 600));
  }
}
