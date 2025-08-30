import 'package:freezed_annotation/freezed_annotation.dart';
import 'health_data_overview_entity.dart';
import 'recovery_goal_entity.dart';
import 'health_education_entity.dart';

part 'dashboard_entity.freezed.dart';

/// 首页数据实体
@freezed
abstract class DashboardEntity with _$DashboardEntity {
  const factory DashboardEntity({
    required HealthDataOverviewEntity healthData,
    required List<RecoveryGoalEntity> recoveryGoals,
    required List<HealthEducationItemEntity> educationItems,
    HealthScoreEntity? healthScore,
    DateTime? lastUpdated,
  }) = _DashboardEntity;

  const DashboardEntity._();

  /// 获取紧急目标（进度低于50%且剩余时间少于7天）
  List<RecoveryGoalEntity> get urgentGoals {
    return recoveryGoals.where((goal) =>
        !goal.isCompleted &&
        goal.progressPercentage < 50 &&
        goal.remainingDays <= 7 &&
        goal.remainingDays > 0
    ).toList();
  }

  /// 获取已完成的目标
  List<RecoveryGoalEntity> get completedGoals {
    return recoveryGoals.where((goal) => goal.isCompleted).toList();
  }

  /// 获取进行中的目标
  List<RecoveryGoalEntity> get activeGoals {
    return recoveryGoals.where((goal) =>
        goal.status == GoalStatus.active && !goal.isCompleted
    ).toList();
  }

  /// 获取推荐的教育内容（未读且相关度高）
  List<HealthEducationItemEntity> get recommendedEducation {
    return educationItems.where((item) => !item.isRead).take(3).toList();
  }

  /// 获取收藏的教育内容
  List<HealthEducationItemEntity> get favoritedEducation {
    return educationItems.where((item) => item.isFavorited).toList();
  }
}

/// 健康评分实体
@freezed
abstract class HealthScoreEntity with _$HealthScoreEntity {
  const factory HealthScoreEntity({
    required int totalScore,
    required Map<String, int> categoryScores,
    required HealthScoreLevel level,
    required String description,
    required List<String> recommendations,
    DateTime? calculatedAt,
  }) = _HealthScoreEntity;

  const HealthScoreEntity._();

  /// 获取评分百分比
  double get scorePercentage => (totalScore / 100.0).clamp(0.0, 1.0);
}

/// 健康评分等级枚举
enum HealthScoreLevel {
  excellent(90, 100, '优秀', '您的健康状况非常好！', 'excellent'),
  good(75, 89, '良好', '您的健康状况较好，请继续保持。', 'good'),
  fair(60, 74, '一般', '您的健康状况尚可，建议改善生活方式。', 'fair'),
  poor(40, 59, '较差', '您的健康状况需要关注，建议咨询医生。', 'poor'),
  critical(0, 39, '危险', '您的健康状况需要立即关注！', 'critical');

    const HealthScoreLevel(
    this.minScore,
    this.maxScore,
    this.label,
    this.description,
    this.colorKey
  );

  final int minScore;
  final int maxScore;
  final String label;
  final String description;
  final String colorKey;

  /// 根据分数获取对应等级
  static HealthScoreLevel fromScore(int score) {
    for (final level in HealthScoreLevel.values) {
      if (score >= level.minScore && score <= level.maxScore) {
        return level;
      }
    }
    return HealthScoreLevel.critical;
  }
}
