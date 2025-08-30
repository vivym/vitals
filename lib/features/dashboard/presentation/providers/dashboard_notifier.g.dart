// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$healthScoreHash() => r'abe6d10165b1294623f6c6d6f034af238435b9bf';

/// 健康评分提供者
///
/// Copied from [healthScore].
@ProviderFor(healthScore)
final healthScoreProvider = AutoDisposeProvider<data.HealthScore?>.internal(
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
typedef HealthScoreRef = AutoDisposeProviderRef<data.HealthScore?>;
String _$urgentGoalsHash() => r'72d2f57f4a7a140b24d04dc9bb9341c968577a8a';

/// 紧急目标提供者
///
/// Copied from [urgentGoals].
@ProviderFor(urgentGoals)
final urgentGoalsProvider =
    AutoDisposeProvider<List<data.RecoveryGoal>>.internal(
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
typedef UrgentGoalsRef = AutoDisposeProviderRef<List<data.RecoveryGoal>>;
String _$recommendedEducationHash() =>
    r'3b286de0c070e4461ff9ed70775fab0ba898c4c1';

/// 推荐教育内容提供者
///
/// Copied from [recommendedEducation].
@ProviderFor(recommendedEducation)
final recommendedEducationProvider =
    AutoDisposeProvider<List<data.HealthEducationItem>>.internal(
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
    AutoDisposeProviderRef<List<data.HealthEducationItem>>;
String _$dashboardNotifierHash() => r'4f853f06caca46aa26db1bc047d8ca0fd187eb9c';

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
