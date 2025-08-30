// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_sign_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$patientSignFormNotifierHash() =>
    r'c6b935a603d46e9f75950b1d77206dad5c0827d1';

/// 患者签约表单状态通知器
/// 管理患者签约表单的状态和验证
///
/// Copied from [PatientSignFormNotifier].
@ProviderFor(PatientSignFormNotifier)
final patientSignFormNotifierProvider =
    AutoDisposeNotifierProvider<
      PatientSignFormNotifier,
      PatientSignFormState
    >.internal(
      PatientSignFormNotifier.new,
      name: r'patientSignFormNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$patientSignFormNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PatientSignFormNotifier = AutoDisposeNotifier<PatientSignFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
