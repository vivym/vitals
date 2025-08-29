import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../data/providers/profile_providers.dart';

part 'get_user_profile_usecase.g.dart';

/// 获取用户资料用例
@riverpod
class GetUserProfileUseCase extends _$GetUserProfileUseCase {
  @override
  Future<Result<UserProfile, AppError>> build() async {
    final repository = ref.read(profileRepositoryProvider);
    return await repository.getUserProfile();
  }

  Future<Result<UserProfile, AppError>> execute({bool forceRefresh = false}) async {
    final repository = ref.read(profileRepositoryProvider);
    return await repository.getUserProfile(forceRefresh: forceRefresh);
  }
}
