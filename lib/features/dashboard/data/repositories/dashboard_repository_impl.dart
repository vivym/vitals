import '../../../../core/errors/app_error.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../datasources/dashboard_local_datasource.dart';
import '../models/dashboard_models.dart';
import 'dashboard_repository.dart';

/// 首页仓库实现
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;
  final DashboardLocalDataSource _localDataSource;

  DashboardRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<DashboardResponse, AppError>> getDashboardData(
    String patientId, {
    bool forceRefresh = false,
  }) async {
    try {
      // 如果不强制刷新，先尝试获取缓存数据
      if (!forceRefresh) {
        final cachedData = await _localDataSource.getCachedDashboard(patientId);
        if (cachedData != null) {
          // 检查缓存是否过期（5分钟）
          final cacheAge = DateTime.now().difference(
            cachedData.lastUpdated ?? DateTime.fromMillisecondsSinceEpoch(0),
          );

          if (cacheAge.inMinutes < 5) {
            return Result.success(cachedData);
          }
        }
      }

      // 获取远程数据
      final remoteData = await _remoteDataSource.getDashboardData(patientId);

      // 合并本地阅读状态
      final updatedData = await _mergeLocalEducationStatus(remoteData);

      // 缓存数据
      await _localDataSource.cacheDashboard(patientId, updatedData);

      return Result.success(updatedData);
    } on AppError catch (e) {
      // 网络错误时，尝试返回缓存数据
      if (e is NetworkError) {
        final cachedData = await _localDataSource.getCachedDashboard(patientId);
        if (cachedData != null) {
          return Result.success(cachedData);
        }
      }
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<List<HealthEducationItem>, AppError>> getEducationItems({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final items = await _remoteDataSource.getEducationItems(
        page: page,
        limit: limit,
      );
      return Result.success(items);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<void, AppError>> markEducationAsRead(String itemId) async {
    try {
      // 先更新本地状态
      await _localDataSource.markEducationAsRead(itemId);

      // 然后同步到服务器
      await _remoteDataSource.markEducationAsRead(itemId);

      return const Result.success(null);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Result<void, AppError>> toggleEducationFavorite(
    String itemId,
    bool isFavorited,
  ) async {
    try {
      // 先更新本地状态
      await _localDataSource.toggleEducationFavorite(itemId, isFavorited);

      // 然后同步到服务器
      await _remoteDataSource.toggleEducationFavorite(itemId, isFavorited);

      return const Result.success(null);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: e.toString(), cause: e));
    }
  }

  /// 合并本地教育内容状态
  Future<DashboardResponse> _mergeLocalEducationStatus(
    DashboardResponse remoteData,
  ) async {
    final readIds = await _localDataSource.getReadEducationIds();
    final favoritedIds = await _localDataSource.getFavoritedEducationIds();

    final updatedEducationItems = remoteData.educationItems.map((item) {
      return item.copyWith(
        isRead: readIds.contains(item.id),
        isFavorited: favoritedIds.contains(item.id),
      );
    }).toList();

    return remoteData.copyWith(educationItems: updatedEducationItems);
  }
}
