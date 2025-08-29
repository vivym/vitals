import '../models/dashboard_models.dart';

/// 首页远程数据源接口
abstract class DashboardRemoteDataSource {
  /// 获取首页数据
  Future<DashboardResponse> getDashboardData(String patientId);

  /// 获取健康数据概览
  Future<HealthDataOverview> getHealthDataOverview(String patientId);

  /// 获取康复目标列表
  Future<List<RecoveryGoal>> getRecoveryGoals(String patientId);

  /// 获取健康教育内容列表
  Future<List<HealthEducationItem>> getEducationItems({
    int page = 1,
    int limit = 10,
  });

  /// 更新教育内容状态
  Future<void> updateEducationStatus(UpdateEducationStatusRequest request);

  /// 标记教育内容为已读
  Future<void> markEducationAsRead(String itemId);

  /// 切换教育内容收藏状态
  Future<void> toggleEducationFavorite(String itemId, bool isFavorited);
}
