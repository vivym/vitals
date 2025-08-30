// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bloodPressureNotifierHash() =>
    r'198ac0f6c3d97eaee2775b55ffc9ee66e165f9c0';

/// 血压状态管理 - 参考Dashboard模块架构
///
/// Copied from [BloodPressureNotifier].
@ProviderFor(BloodPressureNotifier)
final bloodPressureNotifierProvider =
    AutoDisposeNotifierProvider<
      BloodPressureNotifier,
      AsyncValue<BloodPressureState>
    >.internal(
      BloodPressureNotifier.new,
      name: r'bloodPressureNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bloodPressureNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BloodPressureNotifier =
    AutoDisposeNotifier<AsyncValue<BloodPressureState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
