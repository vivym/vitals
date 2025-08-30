import '../../../../core/errors/app_error.dart';
import '../repositories/profile_repository.dart';

/// 数据备份恢复用例

class BackupRestoreUsecase {
  final ProfileRepository _repository;

  BackupRestoreUsecase(this._repository);

  /// 备份用户数据
  Future<Result<void, AppError>> backupUserData(String userId) async {
    try {
      if (userId.trim().isEmpty) {
        return Result.failure(
          AppError.validation(field: 'userId', message: '用户ID不能为空'),
        );
      }

      return await _repository.backupUserData(userId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '备份用户数据失败: ${e.toString()}'),
      );
    }
  }

  /// 恢复用户数据
  Future<Result<void, AppError>> restoreUserData(
    String userId,
    String backupId,
  ) async {
    try {
      if (userId.trim().isEmpty) {
        return Result.failure(
          AppError.validation(field: 'userId', message: '用户ID不能为空'),
        );
      }

      if (backupId.trim().isEmpty) {
        return Result.failure(
          AppError.validation(field: 'backupId', message: '备份ID不能为空'),
        );
      }

      return await _repository.restoreUserData(userId, backupId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '恢复用户数据失败: ${e.toString()}'),
      );
    }
  }

  /// 删除用户账户（危险操作）
  Future<Result<void, AppError>> deleteUserAccount(String userId) async {
    try {
      if (userId.trim().isEmpty) {
        return Result.failure(
          AppError.validation(field: 'userId', message: '用户ID不能为空'),
        );
      }

      return await _repository.deleteUserAccount(userId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '删除用户账户失败: ${e.toString()}'),
      );
    }
  }
}
