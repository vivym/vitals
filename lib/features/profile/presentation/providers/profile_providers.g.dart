// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileRemoteDataSourceHash() =>
    r'13b1fd1e9739b68677a42073226e26a61a8a4eaf';

/// ===== Infrastructure 层 Providers =====
/// 个人中心远程数据源提供者
///
/// Copied from [profileRemoteDataSource].
@ProviderFor(profileRemoteDataSource)
final profileRemoteDataSourceProvider =
    AutoDisposeProvider<ProfileRemoteDataSource>.internal(
      profileRemoteDataSource,
      name: r'profileRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRemoteDataSourceRef =
    AutoDisposeProviderRef<ProfileRemoteDataSource>;
String _$profileLocalDataSourceHash() =>
    r'251365d329eed46ee6f581e8b7a543851aeb672c';

/// 个人中心本地数据源提供者
///
/// Copied from [profileLocalDataSource].
@ProviderFor(profileLocalDataSource)
final profileLocalDataSourceProvider =
    AutoDisposeProvider<ProfileLocalDataSource>.internal(
      profileLocalDataSource,
      name: r'profileLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileLocalDataSourceRef =
    AutoDisposeProviderRef<ProfileLocalDataSource>;
String _$profileRepositoryHash() => r'b5a2bf3efb7d8c68e9da3065457cb473b8455f62';

/// 个人中心仓库提供者
///
/// Copied from [profileRepository].
@ProviderFor(profileRepository)
final profileRepositoryProvider =
    AutoDisposeProvider<ProfileRepository>.internal(
      profileRepository,
      name: r'profileRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$profileRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProfileRepositoryRef = AutoDisposeProviderRef<ProfileRepository>;
String _$getProfileUsecaseHash() => r'7a99ca5130fa9aa1d86b9782a8d80896eee5c156';

/// ===== Domain 层 Use Cases =====
/// 获取个人资料用例
///
/// Copied from [getProfileUsecase].
@ProviderFor(getProfileUsecase)
final getProfileUsecaseProvider =
    AutoDisposeProvider<GetProfileUsecase>.internal(
      getProfileUsecase,
      name: r'getProfileUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getProfileUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProfileUsecaseRef = AutoDisposeProviderRef<GetProfileUsecase>;
String _$updateUserProfileUsecaseHash() =>
    r'0ca1debe4718fa4b19eed8605701988d10692ca2';

/// 更新用户资料用例
///
/// Copied from [updateUserProfileUsecase].
@ProviderFor(updateUserProfileUsecase)
final updateUserProfileUsecaseProvider =
    AutoDisposeProvider<UpdateUserProfileUsecase>.internal(
      updateUserProfileUsecase,
      name: r'updateUserProfileUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateUserProfileUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateUserProfileUsecaseRef =
    AutoDisposeProviderRef<UpdateUserProfileUsecase>;
String _$manageDevicesUsecaseHash() =>
    r'7f7352b221c441fa4e45d3426ba13e4d7ecc690f';

/// 设备管理用例
///
/// Copied from [manageDevicesUsecase].
@ProviderFor(manageDevicesUsecase)
final manageDevicesUsecaseProvider =
    AutoDisposeProvider<ManageDevicesUsecase>.internal(
      manageDevicesUsecase,
      name: r'manageDevicesUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$manageDevicesUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ManageDevicesUsecaseRef = AutoDisposeProviderRef<ManageDevicesUsecase>;
String _$manageAppSettingsUsecaseHash() =>
    r'f0a3ee80ca8b2f7017f593f6c8ffc48158774243';

/// 应用设置管理用例
///
/// Copied from [manageAppSettingsUsecase].
@ProviderFor(manageAppSettingsUsecase)
final manageAppSettingsUsecaseProvider =
    AutoDisposeProvider<ManageAppSettingsUsecase>.internal(
      manageAppSettingsUsecase,
      name: r'manageAppSettingsUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$manageAppSettingsUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ManageAppSettingsUsecaseRef =
    AutoDisposeProviderRef<ManageAppSettingsUsecase>;
String _$backupRestoreUsecaseHash() =>
    r'b21fdb6d47e10bdcba312f8cbdb1cb1f3c92b029';

/// 数据备份恢复用例
///
/// Copied from [backupRestoreUsecase].
@ProviderFor(backupRestoreUsecase)
final backupRestoreUsecaseProvider =
    AutoDisposeProvider<BackupRestoreUsecase>.internal(
      backupRestoreUsecase,
      name: r'backupRestoreUsecaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$backupRestoreUsecaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BackupRestoreUsecaseRef = AutoDisposeProviderRef<BackupRestoreUsecase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
