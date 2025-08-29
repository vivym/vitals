import '../models/dashboard_models.dart';

/// 首页本地数据源接口
abstract class DashboardLocalDataSource {
  /// 获取缓存的首页数据
  Future<DashboardResponse?> getCachedDashboard(String patientId);

  /// 缓存首页数据
  Future<void> cacheDashboard(String patientId, DashboardResponse data);

  /// 清除缓存
  Future<void> clearCache(String patientId);

  /// 获取已读教育内容ID列表
  Future<List<String>> getReadEducationIds();

  /// 标记教育内容为已读
  Future<void> markEducationAsRead(String itemId);

  /// 获取收藏的教育内容ID列表
  Future<List<String>> getFavoritedEducationIds();

  /// 切换教育内容收藏状态
  Future<void> toggleEducationFavorite(String itemId, bool isFavorited);
}
