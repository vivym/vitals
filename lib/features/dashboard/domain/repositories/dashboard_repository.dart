import '../../../../core/errors/app_error.dart';
import '../entities/dashboard_entity.dart';
import '../entities/health_education_entity.dart';

/// 首页仓库接口 - 领域层
abstract class DashboardRepository {
  /// 获取首页数据
  Future<Result<DashboardEntity, AppError>> getDashboardData(
    String patientId, {
    bool forceRefresh = false,
  });

  /// 获取健康教育内容列表
  Future<Result<List<HealthEducationItemEntity>, AppError>> getEducationItems({
    int page = 1,
    int limit = 10,
    String? category,
    List<String>? tags,
  });

  /// 标记教育内容为已读
  Future<Result<void, AppError>> markEducationAsRead(String itemId);

  /// 切换教育内容收藏状态
  Future<Result<void, AppError>> toggleEducationFavorite(
    String itemId,
    bool isFavorited,
  );

  /// 获取健康评分
  Future<Result<HealthScoreEntity, AppError>> calculateHealthScore(
    String patientId,
  );

  /// 刷新健康数据
  Future<Result<void, AppError>> refreshHealthData(String patientId);
}
