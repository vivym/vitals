// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthDataOverview _$HealthDataOverviewFromJson(Map<String, dynamic> json) =>
    _HealthDataOverview(
      bloodPressure: json['bloodPressure'] == null
          ? null
          : BloodPressureSummary.fromJson(
              json['bloodPressure'] as Map<String, dynamic>,
            ),
      heartRate: json['heartRate'] == null
          ? null
          : HeartRateSummary.fromJson(
              json['heartRate'] as Map<String, dynamic>,
            ),
      weight: json['weight'] == null
          ? null
          : WeightSummary.fromJson(json['weight'] as Map<String, dynamic>),
      steps: json['steps'] == null
          ? null
          : StepsSummary.fromJson(json['steps'] as Map<String, dynamic>),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$HealthDataOverviewToJson(_HealthDataOverview instance) =>
    <String, dynamic>{
      'bloodPressure': instance.bloodPressure,
      'heartRate': instance.heartRate,
      'weight': instance.weight,
      'steps': instance.steps,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };

_BloodPressureSummary _$BloodPressureSummaryFromJson(
  Map<String, dynamic> json,
) => _BloodPressureSummary(
  systolic: (json['systolic'] as num).toInt(),
  diastolic: (json['diastolic'] as num).toInt(),
  recordedAt: DateTime.parse(json['recordedAt'] as String),
  level: $enumDecodeNullable(_$BloodPressureLevelEnumMap, json['level']),
  trend: json['trend'] as String?,
);

Map<String, dynamic> _$BloodPressureSummaryToJson(
  _BloodPressureSummary instance,
) => <String, dynamic>{
  'systolic': instance.systolic,
  'diastolic': instance.diastolic,
  'recordedAt': instance.recordedAt.toIso8601String(),
  'level': _$BloodPressureLevelEnumMap[instance.level],
  'trend': instance.trend,
};

const _$BloodPressureLevelEnumMap = {
  BloodPressureLevel.normal: 1,
  BloodPressureLevel.elevated: 2,
  BloodPressureLevel.stage1: 3,
  BloodPressureLevel.stage2: 4,
  BloodPressureLevel.crisis: 5,
};

_HeartRateSummary _$HeartRateSummaryFromJson(Map<String, dynamic> json) =>
    _HeartRateSummary(
      bpm: (json['bpm'] as num).toInt(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      zone: $enumDecodeNullable(_$HeartRateZoneEnumMap, json['zone']),
      trend: json['trend'] as String?,
    );

Map<String, dynamic> _$HeartRateSummaryToJson(_HeartRateSummary instance) =>
    <String, dynamic>{
      'bpm': instance.bpm,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'zone': _$HeartRateZoneEnumMap[instance.zone],
      'trend': instance.trend,
    };

const _$HeartRateZoneEnumMap = {
  HeartRateZone.resting: 1,
  HeartRateZone.light: 2,
  HeartRateZone.moderate: 3,
  HeartRateZone.vigorous: 4,
  HeartRateZone.maximum: 5,
};

_WeightSummary _$WeightSummaryFromJson(Map<String, dynamic> json) =>
    _WeightSummary(
      weight: (json['weight'] as num).toDouble(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      bmi: (json['bmi'] as num?)?.toDouble(),
      category: $enumDecodeNullable(_$BMICategoryEnumMap, json['category']),
      trend: json['trend'] as String?,
    );

Map<String, dynamic> _$WeightSummaryToJson(_WeightSummary instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'bmi': instance.bmi,
      'category': _$BMICategoryEnumMap[instance.category],
      'trend': instance.trend,
    };

const _$BMICategoryEnumMap = {
  BMICategory.underweight: 1,
  BMICategory.normal: 2,
  BMICategory.overweight: 3,
  BMICategory.obese: 4,
};

_StepsSummary _$StepsSummaryFromJson(Map<String, dynamic> json) =>
    _StepsSummary(
      steps: (json['steps'] as num).toInt(),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      goal: (json['goal'] as num?)?.toInt(),
      calories: (json['calories'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StepsSummaryToJson(_StepsSummary instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'goal': instance.goal,
      'calories': instance.calories,
      'distance': instance.distance,
    };

_RecoveryGoal _$RecoveryGoalFromJson(Map<String, dynamic> json) =>
    _RecoveryGoal(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$GoalTypeEnumMap, json['type']),
      targetValue: (json['targetValue'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      unit: json['unit'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      status:
          $enumDecodeNullable(_$GoalStatusEnumMap, json['status']) ??
          GoalStatus.active,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RecoveryGoalToJson(_RecoveryGoal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$GoalTypeEnumMap[instance.type]!,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'unit': instance.unit,
      'deadline': instance.deadline.toIso8601String(),
      'status': _$GoalStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$GoalTypeEnumMap = {
  GoalType.bloodPressure: 1,
  GoalType.cholesterol: 2,
  GoalType.exercise: 3,
  GoalType.medication: 4,
  GoalType.weight: 5,
  GoalType.smoking: 6,
  GoalType.diet: 7,
};

const _$GoalStatusEnumMap = {
  GoalStatus.active: 1,
  GoalStatus.paused: 2,
  GoalStatus.completed: 3,
  GoalStatus.failed: 4,
};

_HealthEducationItem _$HealthEducationItemFromJson(Map<String, dynamic> json) =>
    _HealthEducationItem(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      content: json['content'] as String,
      type: $enumDecode(_$EducationTypeEnumMap, json['type']),
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      readingTimeMinutes: (json['readingTimeMinutes'] as num).toInt(),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      publishedAt: DateTime.parse(json['published_at'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isFavorited: json['isFavorited'] as bool? ?? false,
      category: json['category'] as String?,
      authorName: json['authorName'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      imageUrls:
          (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
    );

Map<String, dynamic> _$HealthEducationItemToJson(
  _HealthEducationItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'content': instance.content,
  'type': _$EducationTypeEnumMap[instance.type]!,
  'imageUrl': instance.imageUrl,
  'videoUrl': instance.videoUrl,
  'readingTimeMinutes': instance.readingTimeMinutes,
  'tags': instance.tags,
  'published_at': instance.publishedAt.toIso8601String(),
  'isRead': instance.isRead,
  'isFavorited': instance.isFavorited,
  'category': instance.category,
  'authorName': instance.authorName,
  'thumbnailUrl': instance.thumbnailUrl,
  'imageUrls': instance.imageUrls,
  'readAt': instance.readAt?.toIso8601String(),
};

const _$EducationTypeEnumMap = {
  EducationType.article: 1,
  EducationType.video: 2,
  EducationType.infographic: 3,
  EducationType.audio: 4,
};

_DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    _DashboardResponse(
      healthData: HealthDataOverview.fromJson(
        json['healthData'] as Map<String, dynamic>,
      ),
      recoveryGoals: (json['recoveryGoals'] as List<dynamic>)
          .map((e) => RecoveryGoal.fromJson(e as Map<String, dynamic>))
          .toList(),
      educationItems: (json['educationItems'] as List<dynamic>)
          .map((e) => HealthEducationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      healthScore: json['healthScore'] == null
          ? null
          : HealthScore.fromJson(json['healthScore'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResponseToJson(_DashboardResponse instance) =>
    <String, dynamic>{
      'healthData': instance.healthData,
      'recoveryGoals': instance.recoveryGoals,
      'educationItems': instance.educationItems,
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'healthScore': instance.healthScore,
    };

_UpdateEducationStatusRequest _$UpdateEducationStatusRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateEducationStatusRequest(
  itemId: json['itemId'] as String,
  isRead: json['isRead'] as bool,
  isFavorited: json['isFavorited'] as bool?,
);

Map<String, dynamic> _$UpdateEducationStatusRequestToJson(
  _UpdateEducationStatusRequest instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'isRead': instance.isRead,
  'isFavorited': instance.isFavorited,
};

_HealthScore _$HealthScoreFromJson(Map<String, dynamic> json) => _HealthScore(
  totalScore: (json['totalScore'] as num).toInt(),
  categoryScores: Map<String, int>.from(json['categoryScores'] as Map),
  level: json['level'] as String,
  description: json['description'] as String,
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  calculatedAt: json['calculated_at'] == null
      ? null
      : DateTime.parse(json['calculated_at'] as String),
);

Map<String, dynamic> _$HealthScoreToJson(_HealthScore instance) =>
    <String, dynamic>{
      'totalScore': instance.totalScore,
      'categoryScores': instance.categoryScores,
      'level': instance.level,
      'description': instance.description,
      'recommendations': instance.recommendations,
      'calculated_at': instance.calculatedAt?.toIso8601String(),
    };
