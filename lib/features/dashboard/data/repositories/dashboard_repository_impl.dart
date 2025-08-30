import '../../../../core/errors/app_error.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/health_education_entity.dart';
import '../../domain/entities/health_data_overview_entity.dart';
import '../../domain/entities/recovery_goal_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../datasources/dashboard_local_datasource.dart';
import '../models/dashboard_models.dart' as data;

/// 首页仓库实现
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;
  final DashboardLocalDataSource _localDataSource;

  DashboardRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<DashboardEntity, AppError>> getDashboardData(
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
            return Result.success(_mapDashboardResponseToEntity(cachedData));
          }
        }
      }

      // 获取远程数据
      final remoteData = await _remoteDataSource.getDashboardData(patientId);

      // 合并本地阅读状态
      final updatedData = await _mergeLocalEducationStatus(remoteData);

      // 缓存数据
      await _localDataSource.cacheDashboard(patientId, updatedData);

      return Result.success(_mapDashboardResponseToEntity(updatedData));
    } on AppError catch (e) {
      // 网络错误时，尝试返回缓存数据
      if (e is NetworkError) {
        final cachedData = await _localDataSource.getCachedDashboard(patientId);
        if (cachedData != null) {
          return Result.success(_mapDashboardResponseToEntity(cachedData));
        }
      }
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: '获取首页数据失败: $e'));
    }
  }

  @override
  Future<Result<List<HealthEducationItemEntity>, AppError>> getEducationItems({
    int page = 1,
    int limit = 10,
    String? category,
    List<String>? tags,
  }) async {
    try {
      final educationItems = await _remoteDataSource.getEducationItems(
        page: page,
        limit: limit,
      );

      // 合并本地阅读状态
      final readIds = await _localDataSource.getReadEducationIds();
      final favoritedIds = await _localDataSource.getFavoritedEducationIds();

      final updatedItems = <data.HealthEducationItem>[];
      for (final item in educationItems) {
        final isRead = readIds.contains(item.id);
        final isFavorited = favoritedIds.contains(item.id);

        updatedItems.add(item.copyWith(
          isRead: isRead,
          isFavorited: isFavorited,
        ));
      }

      return Result.success(
        updatedItems.map(_mapEducationItemToEntity).toList(),
      );
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: '获取教育内容失败: $e'));
    }
  }

  @override
  Future<Result<void, AppError>> markEducationAsRead(String itemId) async {
    try {
      // 本地标记为已读
      await _localDataSource.markEducationAsRead(itemId);

      // 远程标记为已读（可以异步处理）
      try {
        await _remoteDataSource.markEducationAsRead(itemId);
      } catch (e) {
        // 远程标记失败不影响本地操作
        // 可以加入到同步队列中
      }

      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.unknown(message: '标记教育内容已读失败: $e'));
    }
  }

  @override
  Future<Result<void, AppError>> toggleEducationFavorite(
    String itemId,
    bool isFavorited,
  ) async {
    try {
      // 本地更新收藏状态
      await _localDataSource.toggleEducationFavorite(itemId, isFavorited);

      // 远程更新收藏状态（可以异步处理）
      try {
        await _remoteDataSource.toggleEducationFavorite(itemId, isFavorited);
      } catch (e) {
        // 远程更新失败不影响本地操作
        // 可以加入到同步队列中
      }

      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.unknown(message: '更新收藏状态失败: $e'));
    }
  }

  @override
  Future<Result<HealthScoreEntity, AppError>> calculateHealthScore(
    String patientId,
  ) async {
    try {
      // 获取首页数据计算健康评分
      final dashboardResult = await getDashboardData(patientId);

      if (dashboardResult.isFailure) {
        return Result.failure(dashboardResult.error!);
      }

      final dashboard = dashboardResult.data!;
      if (dashboard.healthScore == null) {
        return Result.failure(AppError.unknown(message: '健康评分数据不存在'));
      }
      return Result.success(dashboard.healthScore!);
    } on AppError catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(AppError.unknown(message: '计算健康评分失败: $e'));
    }
  }

  @override
  Future<Result<void, AppError>> refreshHealthData(String patientId) async {
    return getDashboardData(patientId, forceRefresh: true)
        .then((result) => result.isSuccess
            ? const Result.success(null)
            : Result.failure(result.error!));
  }

  /// 合并本地教育内容阅读状态
  Future<data.DashboardResponse> _mergeLocalEducationStatus(
    data.DashboardResponse response,
  ) async {
    final updatedEducationItems = <data.HealthEducationItem>[];

    final readIds = await _localDataSource.getReadEducationIds();
    final favoritedIds = await _localDataSource.getFavoritedEducationIds();

    for (final item in response.educationItems) {
      final isRead = readIds.contains(item.id);
      final isFavorited = favoritedIds.contains(item.id);

      updatedEducationItems.add(item.copyWith(
        isRead: isRead,
        isFavorited: isFavorited,
      ));
    }

    return response.copyWith(educationItems: updatedEducationItems);
  }

  /// 将数据模型转换为领域实体
  DashboardEntity _mapDashboardResponseToEntity(data.DashboardResponse response) {
    return DashboardEntity(
      healthData: _mapHealthDataToEntity(response.healthData),
      recoveryGoals: response.recoveryGoals.map(_mapRecoveryGoalToEntity).toList(),
      educationItems: response.educationItems.map(_mapEducationItemToEntity).toList(),
      healthScore: response.healthScore != null ? _mapHealthScoreToEntity(response.healthScore!) : null,
      lastUpdated: response.lastUpdated,
    );
  }

  HealthDataOverviewEntity _mapHealthDataToEntity(data.HealthDataOverview healthData) {
    return HealthDataOverviewEntity(
      bloodPressure: healthData.bloodPressure != null
          ? _mapBloodPressureToEntity(healthData.bloodPressure!)
          : null,
      heartRate: healthData.heartRate != null
          ? _mapHeartRateToEntity(healthData.heartRate!)
          : null,
      weight: healthData.weight != null
          ? _mapWeightToEntity(healthData.weight!)
          : null,
      steps: healthData.steps != null
          ? _mapStepsToEntity(healthData.steps!)
          : null,
      lastUpdated: healthData.lastUpdated,
    );
  }

  BloodPressureSummaryEntity _mapBloodPressureToEntity(data.BloodPressureSummary bp) {
    return BloodPressureSummaryEntity(
      systolic: bp.systolic,
      diastolic: bp.diastolic,
      recordedAt: bp.recordedAt,
      level: bp.level != null ? _mapBloodPressureLevelToEntity(bp.level!) : null,
      trend: bp.trend,
    );
  }

  BloodPressureLevel _mapBloodPressureLevelToEntity(data.BloodPressureLevel level) {
    switch (level) {
      case data.BloodPressureLevel.normal:
        return BloodPressureLevel.normal;
      case data.BloodPressureLevel.elevated:
        return BloodPressureLevel.elevated;
      case data.BloodPressureLevel.stage1:
        return BloodPressureLevel.stage1;
      case data.BloodPressureLevel.stage2:
        return BloodPressureLevel.stage2;
      case data.BloodPressureLevel.crisis:
        return BloodPressureLevel.crisis;
    }
  }

  HeartRateSummaryEntity _mapHeartRateToEntity(data.HeartRateSummary hr) {
    return HeartRateSummaryEntity(
      bpm: hr.bpm,
      recordedAt: hr.recordedAt,
      zone: hr.zone != null ? _mapHeartRateZoneToEntity(hr.zone!) : null,
      trend: hr.trend,
    );
  }

  HeartRateZone _mapHeartRateZoneToEntity(data.HeartRateZone zone) {
    switch (zone) {
      case data.HeartRateZone.resting:
        return HeartRateZone.resting;
      case data.HeartRateZone.light:
        return HeartRateZone.light;
      case data.HeartRateZone.moderate:
        return HeartRateZone.moderate;
      case data.HeartRateZone.vigorous:
        return HeartRateZone.vigorous;
      case data.HeartRateZone.maximum:
        return HeartRateZone.maximum;
    }
  }

  WeightSummaryEntity _mapWeightToEntity(data.WeightSummary weight) {
    return WeightSummaryEntity(
      weight: weight.weight,
      recordedAt: weight.recordedAt,
      bmi: weight.bmi,
      category: weight.category != null ? _mapBMICategoryToEntity(weight.category!) : null,
      trend: weight.trend,
    );
  }

  BMICategory _mapBMICategoryToEntity(data.BMICategory category) {
    switch (category) {
      case data.BMICategory.underweight:
        return BMICategory.underweight;
      case data.BMICategory.normal:
        return BMICategory.normal;
      case data.BMICategory.overweight:
        return BMICategory.overweight;
      case data.BMICategory.obese:
        return BMICategory.obese;
    }
  }

  StepsSummaryEntity _mapStepsToEntity(data.StepsSummary steps) {
    return StepsSummaryEntity(
      steps: steps.steps,
      goal: steps.goal ?? 0,
      recordedAt: steps.recordedAt,
      calories: steps.calories,
      distance: steps.distance,
    );
  }

  RecoveryGoalEntity _mapRecoveryGoalToEntity(data.RecoveryGoal goal) {
    return RecoveryGoalEntity(
      id: goal.id,
      title: goal.title,
      description: goal.description,
      type: _mapGoalTypeToEntity(goal.type),
      targetValue: goal.targetValue,
      currentValue: goal.currentValue,
      unit: goal.unit,
      deadline: goal.deadline,
      status: _mapGoalStatusToEntity(goal.status),
      createdAt: goal.createdAt,
      updatedAt: goal.updatedAt,
    );
  }

  GoalType _mapGoalTypeToEntity(data.GoalType type) {
    switch (type) {
      case data.GoalType.bloodPressure:
        return GoalType.bloodPressure;
      case data.GoalType.cholesterol:
        return GoalType.cholesterol;
      case data.GoalType.exercise:
        return GoalType.exercise;
      case data.GoalType.medication:
        return GoalType.medication;
      case data.GoalType.weight:
        return GoalType.weight;
      case data.GoalType.smoking:
        return GoalType.smoking;
      case data.GoalType.diet:
        return GoalType.diet;
    }
  }

  GoalStatus _mapGoalStatusToEntity(data.GoalStatus status) {
    switch (status) {
      case data.GoalStatus.active:
        return GoalStatus.active;
      case data.GoalStatus.paused:
        return GoalStatus.paused;
      case data.GoalStatus.completed:
        return GoalStatus.completed;
      case data.GoalStatus.failed:
        return GoalStatus.failed;
    }
  }

  HealthEducationItemEntity _mapEducationItemToEntity(data.HealthEducationItem item) {
    return HealthEducationItemEntity(
      id: item.id,
      title: item.title,
      summary: item.summary,
      content: item.content,
      type: _mapEducationTypeToEntity(item.type),
      category: item.category ?? '',
      tags: item.tags,
      authorName: item.authorName ?? '',
      publishedAt: item.publishedAt,
      readingTimeMinutes: item.readingTimeMinutes,
      thumbnailUrl: item.thumbnailUrl ?? '',
      isRead: item.isRead,
      isFavorited: item.isFavorited,
      videoUrl: item.videoUrl,
      imageUrls: item.imageUrls,
      readAt: item.readAt,
    );
  }

  EducationType _mapEducationTypeToEntity(data.EducationType type) {
    switch (type) {
      case data.EducationType.article:
        return EducationType.article;
      case data.EducationType.video:
        return EducationType.video;
      case data.EducationType.infographic:
        return EducationType.infographic;
      case data.EducationType.audio:
        return EducationType.audio;
    }
  }

  HealthScoreEntity _mapHealthScoreToEntity(data.HealthScore score) {
    return HealthScoreEntity(
      totalScore: score.totalScore,
      categoryScores: score.categoryScores,
      level: HealthScoreLevel.fromScore(score.totalScore),
      description: score.description,
      recommendations: score.recommendations,
      calculatedAt: score.calculatedAt,
    );
  }
}