// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appSettingsNotifierHash() =>
    r'74cae3b89a0e619153bd8481d7d8e91574f914f1';

/// 应用设置状态管理
///
/// Copied from [AppSettingsNotifier].
@ProviderFor(AppSettingsNotifier)
final appSettingsNotifierProvider =
    AutoDisposeNotifierProvider<
      AppSettingsNotifier,
      AsyncValue<AppSettings>
    >.internal(
      AppSettingsNotifier.new,
      name: r'appSettingsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appSettingsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppSettingsNotifier = AutoDisposeNotifier<AsyncValue<AppSettings>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
