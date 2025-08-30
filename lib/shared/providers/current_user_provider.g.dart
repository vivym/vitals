// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserStateHash() => r'7e472831cbecd0f1b987bf1117e09b0fe3928f99';

/// 当前用户状态的便捷访问
///
/// Copied from [currentUserState].
@ProviderFor(currentUserState)
final currentUserStateProvider = AutoDisposeProvider<User?>.internal(
  currentUserState,
  name: r'currentUserStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserStateRef = AutoDisposeProviderRef<User?>;
String _$currentUserHash() => r'0fb16c7f3e1a712273fa6d7217a51a255c435912';

/// 当前用户提供者
/// 这是一个简单的状态提供者，用于存储当前登录的用户信息
///
/// Copied from [CurrentUser].
@ProviderFor(CurrentUser)
final currentUserProvider = NotifierProvider<CurrentUser, User?>.internal(
  CurrentUser.new,
  name: r'currentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUser = Notifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
