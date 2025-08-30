import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_goal_entity.freezed.dart';

/// 康复目标实体
@freezed
abstract class RecoveryGoalEntity with _$RecoveryGoalEntity {
  const factory RecoveryGoalEntity({
    required String id,
    required String title,
    required String description,
    required GoalType type,
    required double targetValue,
    required double currentValue,
    required String unit,
    required DateTime deadline,
    required GoalStatus status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RecoveryGoalEntity;

  const RecoveryGoalEntity._();

  /// 计算进度百分比
  double get progressPercentage {
    if (targetValue == 0) return 0;
    return (currentValue / targetValue * 100).clamp(0, 100);
  }

  /// 是否完成
  bool get isCompleted => status == GoalStatus.completed;

  /// 是否逾期
  bool get isOverdue =>
      DateTime.now().isAfter(deadline) && status != GoalStatus.completed;

  /// 剩余天数
  int get remainingDays {
    final now = DateTime.now();
    if (now.isAfter(deadline)) return 0;
    return deadline.difference(now).inDays;
  }
}

/// 目标类型枚举
enum GoalType {
  bloodPressure('血压控制', 'blood_pressure', 'primary'),
  cholesterol('胆固醇水平', 'cholesterol', 'secondary'),
  exercise('运动目标', 'exercise', 'success'),
  medication('用药依从性', 'medication', 'info'),
  weight('体重管理', 'weight', 'warning'),
  smoking('戒烟目标', 'smoking', 'danger'),
  diet('饮食控制', 'diet', 'success');

  const GoalType(this.label, this.iconKey, this.colorKey);

  final String label;
  final String iconKey;
  final String colorKey;
}

/// 目标状态枚举
enum GoalStatus {
  active('进行中', 'active'),
  paused('已暂停', 'paused'),
  completed('已完成', 'completed'),
  failed('未达成', 'failed');

  const GoalStatus(this.label, this.colorKey);

  final String label;
  final String colorKey;
}
