// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_profile_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserProfileUseCaseHash() =>
    r'3213c1243517fc627efc2469c90096df790e5839';

/// 获取用户资料用例
///
/// Copied from [GetUserProfileUseCase].
@ProviderFor(GetUserProfileUseCase)
final getUserProfileUseCaseProvider =
    AutoDisposeAsyncNotifierProvider<
      GetUserProfileUseCase,
      Result<UserProfile, AppError>
    >.internal(
      GetUserProfileUseCase.new,
      name: r'getUserProfileUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getUserProfileUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GetUserProfileUseCase =
    AutoDisposeAsyncNotifier<Result<UserProfile, AppError>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
