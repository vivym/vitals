import '../../../../core/errors/app_error.dart';
import '../models/dashboard_models.dart';

/// 首页仓库接口
abstract class DashboardRepository {
  /// 获取首页数据
  Future<Result<DashboardResponse, AppError>> getDashboardData(
    String patientId, {
    bool forceRefresh = false,
  });

  /// 获取健康教育内容列表
  Future<Result<List<HealthEducationItem>, AppError>> getEducationItems({
    int page = 1,
    int limit = 10,
  });

  /// 标记教育内容为已读
  Future<Result<void, AppError>> markEducationAsRead(String itemId);

  /// 切换教育内容收藏状态
  Future<Result<void, AppError>> toggleEducationFavorite(
    String itemId,
    bool isFavorited,
  );
}
