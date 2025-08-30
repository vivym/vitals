import 'dart:math' as math;
import '../models/dashboard_models.dart';
import 'dashboard_remote_datasource.dart';

/// Mock 远程数据源实现
class DashboardRemoteDataSourceMock implements DashboardRemoteDataSource {
  final Duration _delay;

  DashboardRemoteDataSourceMock({
    Duration delay = const Duration(milliseconds: 1000),
  }) : _delay = delay;

  @override
  Future<DashboardResponse> getDashboardData(String patientId) async {
    await Future.delayed(_delay);

    print('🔍 [MockDataSource] getDashboardData 被调用');
    print('  - patientId: $patientId');

    final response = DashboardResponse(
      healthData: HealthDataOverview(
        bloodPressure: BloodPressureSummary(
          systolic: 128,
          diastolic: 82,
          recordedAt: DateTime.now().subtract(const Duration(hours: 2)),
          level: BloodPressureLevel.elevated,
          trend: 'stable',
        ),
        heartRate: HeartRateSummary(
          bpm: 72,
          recordedAt: DateTime.now().subtract(const Duration(hours: 1)),
          zone: HeartRateZone.resting,
          trend: 'stable',
        ),
        weight: WeightSummary(
          weight: 68.5,
          recordedAt: DateTime.now().subtract(const Duration(days: 1)),
          bmi: 22.3,
          category: BMICategory.normal,
          trend: 'falling',
        ),
        steps: StepsSummary(
          steps: 7832,
          recordedAt: DateTime.now(),
          goal: 10000,
          calories: 324.5,
          distance: 5.8,
        ),
        lastUpdated: DateTime.now(),
      ),
      healthScore: HealthScore(
        totalScore: 78,
        categoryScores: {
          '血压': 65,
          '心率': 85,
          '体重': 90,
          '运动': 70,
        },
        level: '一般',
        description: '整体健康状况一般，血压偏高需要关注',
        recommendations: [
          '定期监测血压',
          '增加有氧运动',
          '控制饮食中的盐分',
          '保持规律作息',
        ],
        calculatedAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      recoveryGoals: [
        RecoveryGoal(
          id: 'goal_1',
          title: '血压控制目标',
          description: '维持血压在正常范围内',
          type: GoalType.bloodPressure,
          targetValue: 120,
          currentValue: 128,
          unit: 'mmHg',
          deadline: DateTime.now().add(const Duration(days: 60)),
          status: GoalStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 30)),
          updatedAt: DateTime.now(),
        ),
        RecoveryGoal(
          id: 'goal_2',
          title: '每日步数目标',
          description: '每天走路10000步',
          type: GoalType.exercise,
          targetValue: 10000,
          currentValue: 7832,
          unit: '步',
          deadline: DateTime.now().add(const Duration(days: 20)),
          status: GoalStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
          updatedAt: DateTime.now(),
        ),
        RecoveryGoal(
          id: 'goal_3',
          title: '胆固醇控制',
          description: '控制低密度脂蛋白水平',
          type: GoalType.cholesterol,
          targetValue: 1.8,
          currentValue: 2.1,
          unit: 'mmol/L',
          deadline: DateTime.now().add(const Duration(days: 90)),
          status: GoalStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 45)),
          updatedAt: DateTime.now(),
        ),
        RecoveryGoal(
          id: 'goal_4',
          title: '用药依从性',
          description: '按时服用降压药物',
          type: GoalType.medication,
          targetValue: 90,
          currentValue: 85,
          unit: '%',
          deadline: DateTime.now().add(const Duration(days: 30)),
          status: GoalStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 15)),
          updatedAt: DateTime.now(),
        ),
      ],
      educationItems: [
        HealthEducationItem(
          id: 'edu_1',
          title: '为什么要测动态血压？有什么注意事项',
          summary: '动态血压监测是诊断高血压的重要手段，了解其原理和注意事项对准确诊断至关重要',
          content: '动态血压监测的详细内容...',
          type: EducationType.article,
          imageUrl: 'https://example.com/images/dynamic-bp.jpg',
          readingTimeMinutes: 8,
          tags: ['血压', '监测', '注意事项'],
          publishedAt: DateTime.now().subtract(const Duration(days: 2)),
          isRead: false,
          isFavorited: false,
          category: '血压管理',
          authorName: '心血管专家',
          thumbnailUrl: 'https://example.com/images/dynamic-bp.jpg',
        ),
        HealthEducationItem(
          id: 'edu_2',
          title: '低盐饮食与选购',
          summary: '合理的低盐饮食对控制血压有重要作用，学会正确选购低盐食品',
          content: '低盐饮食指南和选购技巧...',
          type: EducationType.video,
          videoUrl: 'https://example.com/videos/low-salt-diet.mp4',
          readingTimeMinutes: 12,
          tags: ['饮食', '低盐', '选购'],
          publishedAt: DateTime.now().subtract(const Duration(days: 5)),
          isRead: true,
          isFavorited: true,
          category: '饮食指导',
          authorName: '营养师',
          thumbnailUrl: 'https://example.com/images/low-salt-diet.jpg',
        ),
        HealthEducationItem(
          id: 'edu_3',
          title: '高血压患者的运动指南',
          summary: '科学运动有助于控制血压，了解适合的运动方式和强度',
          content: '高血压患者运动指南...',
          type: EducationType.article,
          imageUrl: 'https://example.com/images/exercise-guide.jpg',
          readingTimeMinutes: 10,
          tags: ['运动', '高血压', '健康'],
          publishedAt: DateTime.now().subtract(const Duration(days: 7)),
          isRead: false,
          isFavorited: false,
          category: '运动指导',
          authorName: '运动康复师',
          thumbnailUrl: 'https://example.com/images/exercise-guide.jpg',
        ),
      ],
      lastUpdated: DateTime.now(),
    );

    print('🔍 [MockDataSource] 返回数据:');
    print('  - healthScore: ${response.healthScore?.totalScore}');
    print('  - healthData: ${response.healthData.runtimeType}');
    print('  - recoveryGoals: ${response.recoveryGoals.length} 个');
    print('  - educationItems: ${response.educationItems.length} 个');

    return response;
  }

  @override
  Future<HealthDataOverview> getHealthDataOverview(String patientId) async {
    await Future.delayed(_delay);

    return HealthDataOverview(
      bloodPressure: BloodPressureSummary(
        systolic: 128,
        diastolic: 82,
        recordedAt: DateTime.now().subtract(const Duration(hours: 2)),
        level: BloodPressureLevel.elevated,
        trend: 'stable',
      ),
      heartRate: HeartRateSummary(
        bpm: 72,
        recordedAt: DateTime.now().subtract(const Duration(hours: 1)),
        zone: HeartRateZone.resting,
        trend: 'stable',
      ),
      weight: WeightSummary(
        weight: 68.5,
        recordedAt: DateTime.now().subtract(const Duration(days: 1)),
        bmi: 22.3,
        category: BMICategory.normal,
        trend: 'falling',
      ),
      steps: StepsSummary(
        steps: 7832,
        recordedAt: DateTime.now(),
        goal: 10000,
        calories: 324.5,
        distance: 5.8,
      ),
      lastUpdated: DateTime.now(),
    );
  }

  @override
  Future<List<RecoveryGoal>> getRecoveryGoals(String patientId) async {
    await Future.delayed(_delay);

    return [
      RecoveryGoal(
        id: 'goal_1',
        title: '血压控制目标',
        description: '维持血压在正常范围内',
        type: GoalType.bloodPressure,
        targetValue: 120,
        currentValue: 128,
        unit: 'mmHg',
        deadline: DateTime.now().add(const Duration(days: 60)),
        status: GoalStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now(),
      ),
      RecoveryGoal(
        id: 'goal_2',
        title: '每日步数目标',
        description: '每天走路10000步',
        type: GoalType.exercise,
        targetValue: 10000,
        currentValue: 7832,
        unit: '步',
        deadline: DateTime.now().add(const Duration(days: 20)),
        status: GoalStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  @override
  Future<List<HealthEducationItem>> getEducationItems({
    int page = 1,
    int limit = 10,
  }) async {
    await Future.delayed(_delay);

    // 模拟分页数据
    final allItems = List.generate(25, (index) => HealthEducationItem(
      id: 'edu_${index + 1}',
      title: '健康教育文章 ${index + 1}',
      summary: '这是第 ${index + 1} 篇健康教育文章的摘要',
      content: '文章内容...',
      type: index % 3 == 0 ? EducationType.video : EducationType.article,
      readingTimeMinutes: 3 + (index % 10),
      tags: ['健康', '教育'],
      publishedAt: DateTime.now().subtract(Duration(days: index)),
      isRead: index % 4 == 0,
      isFavorited: index % 7 == 0,
      category: '健康教育',
      authorName: '健康专家',
      thumbnailUrl: 'https://example.com/images/health-education.jpg',
    ));

    final startIndex = (page - 1) * limit;
    final endIndex = math.min(startIndex + limit, allItems.length);

    if (startIndex >= allItems.length) {
      return [];
    }

    return allItems.sublist(startIndex, endIndex);
  }

  @override
  Future<void> updateEducationStatus(UpdateEducationStatusRequest request) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock 实现不需要实际操作
  }

  @override
  Future<void> markEducationAsRead(String itemId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock 实现不需要实际操作
  }

  @override
  Future<void> toggleEducationFavorite(String itemId, bool isFavorited) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Mock 实现不需要实际操作
  }
}
