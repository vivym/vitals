// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentEnvironmentHash() =>
    r'd507857102face6347d449926f2d838033e7926c';

/// 环境配置Provider
///
/// Copied from [currentEnvironment].
@ProviderFor(currentEnvironment)
final currentEnvironmentProvider = AutoDisposeProvider<Environment>.internal(
  currentEnvironment,
  name: r'currentEnvironmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentEnvironmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentEnvironmentRef = AutoDisposeProviderRef<Environment>;
String _$apiClientHash() => r'775bc09ba19fc4a5d65a1beed359129f3855edeb';

/// API客户端Provider
///
/// Copied from [apiClient].
@ProviderFor(apiClient)
final apiClientProvider = AutoDisposeProvider<ApiClient>.internal(
  apiClient,
  name: r'apiClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$apiClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiClientRef = AutoDisposeProviderRef<ApiClient>;
String _$networkConfigHash() => r'2c17f10c86ffc77d5879c7bd5d9b7367415c5f42';

/// 网络配置Provider
///
/// Copied from [networkConfig].
@ProviderFor(networkConfig)
final networkConfigProvider = AutoDisposeProvider<ApiClient>.internal(
  networkConfig,
  name: r'networkConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NetworkConfigRef = AutoDisposeProviderRef<ApiClient>;
String _$networkConfigNotifierHash() =>
    r'1ece82a20f79fabc8fafa03f1884b89c1e5fc316';

/// 网络配置管理Provider
///
/// Copied from [NetworkConfigNotifier].
@ProviderFor(NetworkConfigNotifier)
final networkConfigNotifierProvider =
    AutoDisposeNotifierProvider<NetworkConfigNotifier, void>.internal(
      NetworkConfigNotifier.new,
      name: r'networkConfigNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$networkConfigNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NetworkConfigNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
