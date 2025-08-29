import '../../data/models/dashboard_models.dart';

/// 计算健康评分用例
class CalculateHealthScoreUseCase {
  /// 执行健康评分计算
  int execute(HealthDataOverview healthData) {
    int score = 0;
    int totalMetrics = 0;

    // 血压评分 (25分)
    if (healthData.bloodPressure != null) {
      totalMetrics++;
      switch (healthData.bloodPressure!.level) {
        case BloodPressureLevel.normal:
          score += 25;
          break;
        case BloodPressureLevel.elevated:
          score += 20;
          break;
        case BloodPressureLevel.stage1:
          score += 15;
          break;
        case BloodPressureLevel.stage2:
          score += 10;
          break;
        case BloodPressureLevel.crisis:
          score += 5;
          break;
        case null:
          break;
      }
    }

    // 心率评分 (25分)
    if (healthData.heartRate != null) {
      totalMetrics++;
      final bpm = healthData.heartRate!.bpm;
      if (bpm >= 60 && bpm <= 80) {
        score += 25;
      } else if (bpm >= 50 && bpm <= 90) {
        score += 20;
      } else if (bpm >= 40 && bpm <= 100) {
        score += 15;
      } else {
        score += 10;
      }
    }

    // BMI 评分 (25分)
    if (healthData.weight?.bmi != null) {
      totalMetrics++;
      switch (healthData.weight!.bmiCategory) {
        case BMICategory.normal:
          score += 25;
          break;
        case BMICategory.overweight:
        case BMICategory.underweight:
          score += 20;
          break;
        case BMICategory.obese:
          score += 15;
          break;
        case null:
          break;
      }
    }

    // 步数评分 (25分)
    if (healthData.steps != null) {
      totalMetrics++;
      final progress = healthData.steps!.goalProgress;
      if (progress >= 1.0) {
        score += 25;
      } else if (progress >= 0.8) {
        score += 20;
      } else if (progress >= 0.6) {
        score += 15;
      } else if (progress >= 0.4) {
        score += 10;
      } else {
        score += 5;
      }
    }

    // 计算平均分
    if (totalMetrics == 0) return 0;
    return (score / totalMetrics * 4).round(); // 转换为100分制
  }
}
