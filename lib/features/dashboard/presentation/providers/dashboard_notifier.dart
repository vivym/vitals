import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/models/dashboard_models.dart' as data;
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/entities/health_data_overview_entity.dart';
import '../../domain/entities/recovery_goal_entity.dart';
import '../../domain/entities/health_education_entity.dart';
import 'dashboard_providers.dart';

part 'dashboard_notifier.g.dart';

/// 首页状态
class DashboardState {
  final data.HealthDataOverview? healthData;
  final List<data.RecoveryGoal> recoveryGoals;
  final List<data.HealthEducationItem> educationItems;
  final data.HealthScore? healthScore;
  final DateTime? lastUpdated;
  final bool isRefreshing;
  final String? error;

  const DashboardState({
    this.healthData,
    this.recoveryGoals = const [],
    this.educationItems = const [],
    this.healthScore,
    this.lastUpdated,
    this.isRefreshing = false,
    this.error,
  });

  DashboardState copyWith({
    data.HealthDataOverview? healthData,
    List<data.RecoveryGoal>? recoveryGoals,
    List<data.HealthEducationItem>? educationItems,
    data.HealthScore? healthScore,
    DateTime? lastUpdated,
    bool? isRefreshing,
    String? error,
  }) {
    return DashboardState(
      healthData: healthData ?? this.healthData,
      recoveryGoals: recoveryGoals ?? this.recoveryGoals,
      educationItems: educationItems ?? this.educationItems,
      healthScore: healthScore ?? this.healthScore,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      error: error ?? this.error,
    );
  }

  /// 获取紧急目标
  List<data.RecoveryGoal> get urgentGoals {
    return recoveryGoals.where((goal) =>
        !goal.isCompleted &&
        goal.progress < 0.5 &&
        goal.daysRemaining <= 7 &&
        goal.daysRemaining > 0
    ).toList();
  }

  /// 获取推荐的教育内容
  List<data.HealthEducationItem> get recommendedEducation {
    return educationItems.where((item) => !item.isRead).take(3).toList();
  }
}

/// 首页状态管理
@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  AsyncValue<DashboardState> build() {
    _loadInitialData();
    return const AsyncValue.loading();
  }

  /// 刷新数据
  Future<void> refresh() async {
    if (state.isLoading) return;

    // 设置刷新状态
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(isRefreshing: true));
    });

    await _loadDashboardData(forceRefresh: true);
  }

  /// 标记教育内容为已读
  Future<void> markEducationAsRead(String itemId) async {
    final useCase = ref.read(markEducationAsReadUseCaseProvider);
    final result = await useCase.execute(itemId);

    result.when(
      success: (_) {
        // 更新本地状态
        state.whenData((currentState) {
          final updatedEducationItems = currentState.educationItems.map((item) {
            if (item.id == itemId) {
              return item.copyWith(isRead: true, readAt: DateTime.now());
            }
            return item;
          }).toList();

          state = AsyncValue.data(currentState.copyWith(
            educationItems: updatedEducationItems,
          ));
        });
      },
      failure: (error) {
        // 处理错误，但不影响当前状态
        _handleError(error);
      },
    );
  }

  /// 切换教育内容收藏状态
  Future<void> toggleEducationFavorite(String itemId) async {
    // 先更新本地状态以提供即时反馈
    state.whenData((currentState) {
      final updatedEducationItems = currentState.educationItems.map((item) {
        if (item.id == itemId) {
          return item.copyWith(isFavorited: !item.isFavorited);
        }
        return item;
      }).toList();

      state = AsyncValue.data(currentState.copyWith(
        educationItems: updatedEducationItems,
      ));
    });

    // 获取当前收藏状态
    final currentItem = state.value?.educationItems.firstWhere(
      (item) => item.id == itemId,
    );

    if (currentItem == null) return;

    final useCase = ref.read(toggleEducationFavoriteUseCaseProvider);
    final result = await useCase.execute(itemId, currentItem.isFavorited);

    result.when(
      success: (_) {
        // 远程操作成功，状态已经更新
      },
      failure: (error) {
        // 远程操作失败，回滚本地状态
        state.whenData((currentState) {
          final revertedEducationItems = currentState.educationItems.map((item) {
            if (item.id == itemId) {
              return item.copyWith(isFavorited: !item.isFavorited);
            }
            return item;
          }).toList();

          state = AsyncValue.data(currentState.copyWith(
            educationItems: revertedEducationItems,
          ));
        });

        _handleError(error);
      },
    );
  }

  /// 计算健康评分
  Future<void> calculateHealthScore() async {
    final authState = ref.read(authNotifierProvider);
    final patientId = authState.patient?.id;

    if (patientId == null) return;

    final useCase = ref.read(calculateHealthScoreUseCaseProvider);
    final result = await useCase.execute(patientId);

    result.when(
      success: (healthScore) {
        state.whenData((currentState) {
          // TODO: 转换 HealthScoreEntity 到 HealthScore
          state = AsyncValue.data(currentState.copyWith(
            healthScore: null,
          ));
        });
      },
      failure: (error) {
        _handleError(error);
      },
    );
  }

  /// 加载初始数据
  Future<void> _loadInitialData() async {
    await _loadDashboardData(forceRefresh: false);
  }

  /// 加载首页数据
  Future<void> _loadDashboardData({required bool forceRefresh}) async {
    try {
      final authState = ref.read(authNotifierProvider);
      final patientId = authState.patient?.id;

      if (patientId == null) {
        state = AsyncValue.error(
          AppError.authentication(message: '用户未登录或未签约患者'),
          StackTrace.current,
        );
        return;
      }

      final useCase = ref.read(getDashboardDataUseCaseProvider);
      final result = await useCase.execute(patientId, forceRefresh: forceRefresh);

      result.when(
        success: (dashboardEntity) {
          // 将领域实体转换为数据模型
          state = AsyncValue.data(DashboardState(
            healthData: _mapHealthDataOverview(dashboardEntity.healthData),
            recoveryGoals: _mapRecoveryGoals(dashboardEntity.recoveryGoals),
            educationItems: _mapEducationItems(dashboardEntity.educationItems),
            healthScore: _mapHealthScore(dashboardEntity.healthScore),
            lastUpdated: dashboardEntity.lastUpdated,
          ));
        },
        failure: (error) {
          state = AsyncValue.error(error, StackTrace.current);
        },
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(
        AppError.unknown(message: '加载首页数据失败: $e'),
        stackTrace,
      );
    }
  }

  /// 处理错误
  void _handleError(AppError error) {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(
        error: error.toString(),
        isRefreshing: false,
      ));
    });
  }
}

// =============================================================================
// 特定数据提供者
// =============================================================================

/// 健康评分提供者
@riverpod
data.HealthScore? healthScore(HealthScoreRef ref) {
  final dashboardState = ref.watch(dashboardNotifierProvider);
  return dashboardState.whenOrNull(
    data: (state) => state.healthScore,
  );
}

/// 紧急目标提供者
@riverpod
List<data.RecoveryGoal> urgentGoals(UrgentGoalsRef ref) {
  final dashboardState = ref.watch(dashboardNotifierProvider);
  return dashboardState.whenOrNull(
    data: (state) => state.urgentGoals,
  ) ?? [];
}

/// 推荐教育内容提供者
@riverpod
List<data.HealthEducationItem> recommendedEducation(RecommendedEducationRef ref) {
  final dashboardState = ref.watch(dashboardNotifierProvider);
  return dashboardState.whenOrNull(
    data: (state) => state.recommendedEducation,
  ) ?? [];
}

// =============================================================================
// 数据转换方法
// =============================================================================

/// 转换健康数据概览实体到数据模型
data.HealthDataOverview? _mapHealthDataOverview(
  HealthDataOverviewEntity? entity,
) {
  if (entity == null) return null;

  return data.HealthDataOverview(
    bloodPressure: entity.bloodPressure != null
        ? _mapBloodPressureSummary(entity.bloodPressure!)
        : null,
    heartRate: entity.heartRate != null
        ? _mapHeartRateSummary(entity.heartRate!)
        : null,
    weight: entity.weight != null
        ? _mapWeightSummary(entity.weight!)
        : null,
    steps: entity.steps != null
        ? _mapStepsSummary(entity.steps!)
        : null,
    lastUpdated: entity.lastUpdated,
  );
}

/// 转换血压摘要实体到数据模型
data.BloodPressureSummary? _mapBloodPressureSummary(
  BloodPressureSummaryEntity entity,
) {
  return data.BloodPressureSummary(
    systolic: entity.systolic,
    diastolic: entity.diastolic,
    recordedAt: entity.recordedAt,
    level: _mapBloodPressureLevel(entity.level),
    trend: entity.trend,
  );
}

/// 转换心率摘要实体到数据模型
data.HeartRateSummary? _mapHeartRateSummary(
  HeartRateSummaryEntity entity,
) {
  return data.HeartRateSummary(
    bpm: entity.bpm,
    recordedAt: entity.recordedAt,
    zone: _mapHeartRateZone(entity.zone),
    trend: entity.trend,
  );
}

/// 转换体重摘要实体到数据模型
data.WeightSummary? _mapWeightSummary(
  WeightSummaryEntity entity,
) {
  return data.WeightSummary(
    weight: entity.weight,
    recordedAt: entity.recordedAt,
    bmi: entity.bmi,
    category: _mapBMICategory(entity.category),
    trend: entity.trend,
  );
}

/// 转换步数摘要实体到数据模型
data.StepsSummary? _mapStepsSummary(
  StepsSummaryEntity entity,
) {
  return data.StepsSummary(
    steps: entity.steps,
    recordedAt: entity.recordedAt,
    goal: entity.goal,
    calories: entity.calories,
    distance: entity.distance,
  );
}

/// 转换康复目标实体列表到数据模型列表
List<data.RecoveryGoal> _mapRecoveryGoals(
  List<RecoveryGoalEntity> entities,
) {
  return entities.map((entity) => data.RecoveryGoal(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    type: _mapGoalType(entity.type),
    targetValue: entity.targetValue,
    currentValue: entity.currentValue,
    unit: entity.unit,
    deadline: entity.deadline,
    status: _mapGoalStatus(entity.status),
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
  )).toList();
}

/// 转换健康教育内容实体列表到数据模型列表
List<data.HealthEducationItem> _mapEducationItems(
  List<HealthEducationItemEntity> entities,
) {
  return entities.map((entity) => data.HealthEducationItem(
    id: entity.id,
    title: entity.title,
    summary: entity.summary,
    content: entity.content,
    type: _mapEducationType(entity.type),
    imageUrl: entity.thumbnailUrl,
    videoUrl: entity.videoUrl,
    readingTimeMinutes: entity.readingTimeMinutes,
    tags: entity.tags,
    publishedAt: entity.publishedAt,
    isRead: entity.isRead,
    isFavorited: entity.isFavorited,
    readAt: entity.readAt,
  )).toList();
}

/// 转换健康评分实体到数据模型
data.HealthScore? _mapHealthScore(
  HealthScoreEntity? entity,
) {
  if (entity == null) return null;

  return data.HealthScore(
    totalScore: entity.totalScore,
    categoryScores: entity.categoryScores,
    level: entity.level.label, // 将枚举转换为字符串标签
    description: entity.description,
    recommendations: entity.recommendations,
    calculatedAt: entity.calculatedAt,
  );
}

// =============================================================================
// 枚举转换方法
// =============================================================================

/// 转换血压水平枚举
data.BloodPressureLevel? _mapBloodPressureLevel(
  BloodPressureLevel? level,
) {
  if (level == null) return null;

  switch (level) {
    case BloodPressureLevel.normal:
      return data.BloodPressureLevel.normal;
    case BloodPressureLevel.elevated:
      return data.BloodPressureLevel.elevated;
    case BloodPressureLevel.stage1:
      return data.BloodPressureLevel.stage1;
    case BloodPressureLevel.stage2:
      return data.BloodPressureLevel.stage2;
    case BloodPressureLevel.crisis:
      return data.BloodPressureLevel.crisis;
  }
}

/// 转换心率区间枚举
data.HeartRateZone? _mapHeartRateZone(
  HeartRateZone? zone,
) {
  if (zone == null) return null;

  switch (zone) {
    case HeartRateZone.resting:
      return data.HeartRateZone.resting;
    case HeartRateZone.light:
      return data.HeartRateZone.light;
    case HeartRateZone.moderate:
      return data.HeartRateZone.moderate;
    case HeartRateZone.vigorous:
      return data.HeartRateZone.vigorous;
    case HeartRateZone.maximum:
      return data.HeartRateZone.maximum;
  }
}

/// 转换BMI分类枚举
data.BMICategory? _mapBMICategory(
  BMICategory? category,
) {
  if (category == null) return null;

  switch (category) {
    case BMICategory.underweight:
      return data.BMICategory.underweight;
    case BMICategory.normal:
      return data.BMICategory.normal;
    case BMICategory.overweight:
      return data.BMICategory.overweight;
    case BMICategory.obese:
      return data.BMICategory.obese;
  }
}

/// 转换目标类型枚举
data.GoalType _mapGoalType(GoalType type) {
  switch (type) {
    case GoalType.bloodPressure:
      return data.GoalType.bloodPressure;
    case GoalType.cholesterol:
      return data.GoalType.cholesterol;
    case GoalType.exercise:
      return data.GoalType.exercise;
    case GoalType.medication:
      return data.GoalType.medication;
    case GoalType.weight:
      return data.GoalType.weight;
    case GoalType.smoking:
      return data.GoalType.smoking;
    case GoalType.diet:
      return data.GoalType.diet;
  }
}

/// 转换目标状态枚举
data.GoalStatus _mapGoalStatus(GoalStatus status) {
  switch (status) {
    case GoalStatus.active:
      return data.GoalStatus.active;
    case GoalStatus.paused:
      return data.GoalStatus.paused;
    case GoalStatus.completed:
      return data.GoalStatus.completed;
    case GoalStatus.failed:
      return data.GoalStatus.failed;
  }
}

/// 转换教育内容类型枚举
data.EducationType _mapEducationType(EducationType type) {
  switch (type) {
    case EducationType.article:
      return data.EducationType.article;
    case EducationType.video:
      return data.EducationType.video;
    case EducationType.infographic:
      return data.EducationType.infographic;
    case EducationType.audio:
      return data.EducationType.audio;
  }
}
