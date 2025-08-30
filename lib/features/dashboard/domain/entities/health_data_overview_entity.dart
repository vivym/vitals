import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_data_overview_entity.freezed.dart';

/// 健康数据概览实体
@freezed
abstract class HealthDataOverviewEntity with _$HealthDataOverviewEntity {
  const factory HealthDataOverviewEntity({
    BloodPressureSummaryEntity? bloodPressure,
    HeartRateSummaryEntity? heartRate,
    WeightSummaryEntity? weight,
    StepsSummaryEntity? steps,
    DateTime? lastUpdated,
  }) = _HealthDataOverviewEntity;
}

/// 血压概览实体
@freezed
abstract class BloodPressureSummaryEntity with _$BloodPressureSummaryEntity {
  const factory BloodPressureSummaryEntity({
    required int systolic,
    required int diastolic,
    required DateTime recordedAt,
    BloodPressureLevel? level,
    String? trend,
  }) = _BloodPressureSummaryEntity;
}

/// 血压水平枚举
enum BloodPressureLevel {
  normal(1, '正常', 'normal'),
  elevated(2, '血压偏高', 'elevated'),
  stage1(3, '1级高血压', 'stage1'),
  stage2(4, '2级高血压', 'stage2'),
  crisis(5, '高血压危象', 'crisis');

  const BloodPressureLevel(this.value, this.label, this.colorKey);

  final int value;
  final String label;
  final String colorKey;
}

/// 心率概览实体
@freezed
abstract class HeartRateSummaryEntity with _$HeartRateSummaryEntity {
  const factory HeartRateSummaryEntity({
    required int bpm,
    required DateTime recordedAt,
    HeartRateZone? zone,
    String? trend,
  }) = _HeartRateSummaryEntity;
}

/// 心率区间枚举
enum HeartRateZone {
  resting(1, '静息', 'resting'),
  light(2, '轻度活动', 'light'),
  moderate(3, '中度活动', 'moderate'),
  vigorous(4, '剧烈活动', 'vigorous'),
  maximum(5, '最大心率', 'maximum');

  const HeartRateZone(this.value, this.label, this.colorKey);

  final int value;
  final String label;
  final String colorKey;
}

/// 体重概览实体
@freezed
abstract class WeightSummaryEntity with _$WeightSummaryEntity {
  const factory WeightSummaryEntity({
    required double weight,
    required DateTime recordedAt,
    double? bmi,
    BMICategory? category,
    String? trend,
  }) = _WeightSummaryEntity;
}

/// BMI 分类枚举
enum BMICategory {
  underweight(1, '偏瘦', 'underweight'),
  normal(2, '正常', 'normal'),
  overweight(3, '超重', 'overweight'),
  obese(4, '肥胖', 'obese');

  const BMICategory(this.value, this.label, this.colorKey);

  final int value;
  final String label;
  final String colorKey;
}

/// 步数概览实体
@freezed
abstract class StepsSummaryEntity with _$StepsSummaryEntity {
  const factory StepsSummaryEntity({
    required int steps,
    required int goal,
    required DateTime recordedAt,
    double? calories,
    double? distance,
  }) = _StepsSummaryEntity;
}
