import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

// =============================================================================
// 健康数据概览模型
// =============================================================================

/// 健康数据概览
@freezed
abstract class HealthDataOverview with _$HealthDataOverview {
  const factory HealthDataOverview({
    BloodPressureSummary? bloodPressure,
    HeartRateSummary? heartRate,
    WeightSummary? weight,
    StepsSummary? steps,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _HealthDataOverview;

  factory HealthDataOverview.fromJson(Map<String, dynamic> json) =>
      _$HealthDataOverviewFromJson(json);
}

/// 血压概览数据
@freezed
abstract class BloodPressureSummary with _$BloodPressureSummary {
  const factory BloodPressureSummary({
    required int systolic,      // 收缩压
    required int diastolic,     // 舒张压
    required DateTime recordedAt,
    BloodPressureLevel? level,  // 血压水平评估
    String? trend,             // 趋势：rising, falling, stable
  }) = _BloodPressureSummary;

  factory BloodPressureSummary.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureSummaryFromJson(json);
}

/// 血压水平枚举
@JsonEnum(valueField: 'value')
enum BloodPressureLevel {
  normal(1, '正常', Color(0xFF4CAF50)),
  elevated(2, '血压偏高', Color(0xFFFF9800)),
  stage1(3, '1级高血压', Color(0xFFFF5722)),
  stage2(4, '2级高血压', Color(0xFFF44336)),
  crisis(5, '高血压危象', Color(0xFF9C27B0));

  const BloodPressureLevel(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

/// 心率概览数据
@freezed
abstract class HeartRateSummary with _$HeartRateSummary {
  const factory HeartRateSummary({
    required int bpm,
    required DateTime recordedAt,
    HeartRateZone? zone,
    String? trend,
  }) = _HeartRateSummary;

  factory HeartRateSummary.fromJson(Map<String, dynamic> json) =>
      _$HeartRateSummaryFromJson(json);
}

/// 心率区间
@JsonEnum(valueField: 'value')
enum HeartRateZone {
  resting(1, '静息', Color(0xFF2196F3)),
  light(2, '轻度活动', Color(0xFF4CAF50)),
  moderate(3, '中度活动', Color(0xFFFF9800)),
  vigorous(4, '剧烈活动', Color(0xFFFF5722)),
  maximum(5, '最大心率', Color(0xFFF44336));

  const HeartRateZone(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

/// 体重概览数据
@freezed
abstract class WeightSummary with _$WeightSummary {
  const factory WeightSummary({
    required double weight,     // 单位：kg
    required DateTime recordedAt,
    double? bmi,
    BMICategory? category,
    String? trend,
  }) = _WeightSummary;

  factory WeightSummary.fromJson(Map<String, dynamic> json) =>
      _$WeightSummaryFromJson(json);
}

/// BMI 分类
@JsonEnum(valueField: 'value')
enum BMICategory {
  underweight(1, '偏瘦', Color(0xFF2196F3)),
  normal(2, '正常', Color(0xFF4CAF50)),
  overweight(3, '偏胖', Color(0xFFFF9800)),
  obese(4, '肥胖', Color(0xFFFF5722));

  const BMICategory(this.value, this.label, this.color);
  final int value;
  final String label;
  final Color color;
}

/// 步数概览数据
@freezed
abstract class StepsSummary with _$StepsSummary {
  const factory StepsSummary({
    required int steps,
    required DateTime recordedAt,
    int? goal,
    double? calories,
    double? distance,    // 单位：km
  }) = _StepsSummary;

  factory StepsSummary.fromJson(Map<String, dynamic> json) =>
      _$StepsSummaryFromJson(json);

  const StepsSummary._();

  double get goalProgress => goal != null && goal! > 0 ? steps / goal! : 0.0;
  bool get goalAchieved => goalProgress >= 1.0;
}

// =============================================================================
// 康复目标模型
// =============================================================================

/// 康复目标
@freezed
abstract class RecoveryGoal with _$RecoveryGoal {
  const factory RecoveryGoal({
    required String id,
    required String title,
    required String description,
    required GoalType type,
    required double targetValue,
    required double currentValue,
    required String unit,
    required DateTime deadline,
    @Default(GoalStatus.active) GoalStatus status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _RecoveryGoal;

  factory RecoveryGoal.fromJson(Map<String, dynamic> json) =>
      _$RecoveryGoalFromJson(json);

  const RecoveryGoal._();

  double get progress => targetValue > 0 ? currentValue / targetValue : 0.0;
  bool get isCompleted => progress >= 1.0;
  bool get isExpired => DateTime.now().isAfter(deadline);

  int get daysRemaining {
    final now = DateTime.now();
    if (now.isAfter(deadline)) return 0;
    return deadline.difference(now).inDays;
  }
}

/// 目标类型
@JsonEnum(valueField: 'value')
enum GoalType {
  bloodPressure(1, '血压控制', Icons.favorite, Color(0xFFE91E63)),
  cholesterol(2, '胆固醇', Icons.water_drop, Color(0xFF2196F3)),
  exercise(3, '运动目标', Icons.directions_run, Color(0xFF4CAF50)),
  medication(4, '用药依从性', Icons.medication, Color(0xFFFF9800)),
  weight(5, '体重管理', Icons.monitor_weight, Color(0xFF9C27B0)),
  smoking(6, '戒烟目标', Icons.smoke_free, Color(0xFF795548)),
  diet(7, '饮食控制', Icons.restaurant, Color(0xFF8BC34A));

  const GoalType(this.value, this.label, this.icon, this.color);
  final int value;
  final String label;
  final IconData icon;
  final Color color;
}

/// 目标状态
@JsonEnum(valueField: 'value')
enum GoalStatus {
  active(1, '进行中'),
  paused(2, '已暂停'),
  completed(3, '已完成'),
  failed(4, '未达成');

  const GoalStatus(this.value, this.label);
  final int value;
  final String label;
}

// =============================================================================
// 健康教育模型
// =============================================================================

/// 健康教育内容
@freezed
abstract class HealthEducationItem with _$HealthEducationItem {
  const factory HealthEducationItem({
    required String id,
    required String title,
    required String summary,
    required String content,
    required EducationType type,
    String? imageUrl,
    String? videoUrl,
    required int readingTimeMinutes,    // 预计阅读时间（分钟）
    @Default([]) List<String> tags,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @Default(false) bool isRead,
    @Default(false) bool isFavorited,
    String? category,
    String? authorName,
    String? thumbnailUrl,
    @Default([]) List<String> imageUrls,
    DateTime? readAt,
  }) = _HealthEducationItem;

  factory HealthEducationItem.fromJson(Map<String, dynamic> json) =>
      _$HealthEducationItemFromJson(json);
}

/// 教育内容类型
@JsonEnum(valueField: 'value')
enum EducationType {
  article(1, '文章', Icons.article),
  video(2, '视频', Icons.play_circle),
  infographic(3, '图解', Icons.image),
  audio(4, '音频', Icons.headphones);

  const EducationType(this.value, this.label, this.icon);
  final int value;
  final String label;
  final IconData icon;
}

// =============================================================================
// 首页状态模型
// =============================================================================

/// 首页状态
@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    HealthDataOverview? healthData,
    @Default([]) List<RecoveryGoal> recoveryGoals,
    @Default([]) List<HealthEducationItem> educationItems,
    HealthScore? healthScore,
    DateTime? lastUpdated,
    @Default(false) bool isRefreshing,
    String? error,
  }) = _DashboardState;

  const DashboardState._();

  bool get hasError => error != null;
  bool get hasData => healthData != null || recoveryGoals.isNotEmpty;
  bool get isEmpty => !hasData;

  List<RecoveryGoal> get activeGoals => recoveryGoals
      .where((goal) => goal.status == GoalStatus.active)
      .toList();

  List<HealthEducationItem> get unreadEducation => educationItems
      .where((item) => !item.isRead)
      .toList();
}

// =============================================================================
// API 响应模型
// =============================================================================

/// 首页聚合数据响应
@freezed
abstract class DashboardResponse with _$DashboardResponse {
  const factory DashboardResponse({
    required HealthDataOverview healthData,
    required List<RecoveryGoal> recoveryGoals,
    required List<HealthEducationItem> educationItems,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
    HealthScore? healthScore,
  }) = _DashboardResponse;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);
}

/// 教育内容阅读状态更新请求
@freezed
abstract class UpdateEducationStatusRequest with _$UpdateEducationStatusRequest {
  const factory UpdateEducationStatusRequest({
    required String itemId,
    required bool isRead,
    bool? isFavorited,
  }) = _UpdateEducationStatusRequest;

  factory UpdateEducationStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEducationStatusRequestFromJson(json);
}

// =============================================================================
// 健康评分模型
// =============================================================================

/// 健康评分
@freezed
abstract class HealthScore with _$HealthScore {
  const factory HealthScore({
    required int totalScore,
    required Map<String, int> categoryScores,
    required String level,
    required String description,
    required List<String> recommendations,
    @JsonKey(name: 'calculated_at') DateTime? calculatedAt,
  }) = _HealthScore;

  factory HealthScore.fromJson(Map<String, dynamic> json) =>
      _$HealthScoreFromJson(json);
}
