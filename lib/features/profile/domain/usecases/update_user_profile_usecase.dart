import '../../../../core/errors/app_error.dart';
import '../entities/user_profile_entity.dart';
import '../repositories/profile_repository.dart';

/// 更新用户资料用例

class UpdateUserProfileUsecase {
  final ProfileRepository _repository;

  UpdateUserProfileUsecase(this._repository);

  /// 执行更新用户资料
  Future<Result<UserProfileEntity, AppError>> call(
    String userId,
    UserProfileEntity profile,
  ) async {
    try {
      // 验证输入数据
      final validationResult = _validateProfile(profile);
      if (validationResult.isFailure) {
        return validationResult.cast<UserProfileEntity>();
      }

      return await _repository.updateUserProfile(userId, profile);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '更新用户资料失败: ${e.toString()}'),
      );
    }
  }

  /// 验证用户资料
  Result<void, AppError> _validateProfile(UserProfileEntity profile) {
    // 检查必填字段
    if (profile.name.trim().isEmpty) {
      return Result.failure(
        AppError.validation(field: 'name', message: '姓名不能为空'),
      );
    }

    if (profile.phone.trim().isEmpty) {
      return Result.failure(
        AppError.validation(field: 'phone', message: '手机号不能为空'),
      );
    }

    // 验证手机号格式
    final phoneRegex = RegExp(r'^1[3-9]\d{9}$');
    if (!phoneRegex.hasMatch(profile.phone.trim())) {
      return Result.failure(
        AppError.validation(field: 'phone', message: '手机号格式不正确'),
      );
    }

    // 验证邮箱格式（如果提供）
    if (profile.email != null && profile.email!.trim().isNotEmpty) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      if (!emailRegex.hasMatch(profile.email!.trim())) {
        return Result.failure(
          AppError.validation(field: 'email', message: '邮箱格式不正确'),
        );
      }
    }

    // 验证年龄（如果有生日）
    if (profile.birthDate != null) {
      final age = profile.age;
      if (age != null && (age < 0 || age > 150)) {
        return Result.failure(
          AppError.validation(field: 'birthDate', message: '生日设置不合理'),
        );
      }
    }

    return const Result.success(null);
  }
}
