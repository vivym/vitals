// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthScoreHash() => r'e53d9cc237b44f3e373db1a793917f8b6b577d86';

/// 健康评分计算
///
/// Copied from [healthScore].
@ProviderFor(healthScore)
final healthScoreProvider = AutoDisposeProvider<int>.internal(
  healthScore,
  name: r'healthScoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$healthScoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HealthScoreRef = AutoDisposeProviderRef<int>;
String _$urgentGoalsHash() => r'12662c3ff5e46883ade7c86e7adc752e1ca9a4cc';

/// 便利的派生状态
///
/// Copied from [urgentGoals].
@ProviderFor(urgentGoals)
final urgentGoalsProvider = AutoDisposeProvider<List<RecoveryGoal>>.internal(
  urgentGoals,
  name: r'urgentGoalsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$urgentGoalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UrgentGoalsRef = AutoDisposeProviderRef<List<RecoveryGoal>>;
String _$recommendedEducationHash() =>
    r'6711e1f5a13fb1bf1752b230c4b710d98f238722';

/// See also [recommendedEducation].
@ProviderFor(recommendedEducation)
final recommendedEducationProvider =
    AutoDisposeProvider<List<HealthEducationItem>>.internal(
      recommendedEducation,
      name: r'recommendedEducationProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recommendedEducationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecommendedEducationRef =
    AutoDisposeProviderRef<List<HealthEducationItem>>;
String _$dashboardNotifierHash() => r'9fbd89726e67ca8d3b99473ae0baf49f9fe443ef';

/// 首页状态管理
///
/// Copied from [DashboardNotifier].
@ProviderFor(DashboardNotifier)
final dashboardNotifierProvider =
    AutoDisposeNotifierProvider<
      DashboardNotifier,
      AsyncValue<DashboardState>
    >.internal(
      DashboardNotifier.new,
      name: r'dashboardNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dashboardNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DashboardNotifier = AutoDisposeNotifier<AsyncValue<DashboardState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
