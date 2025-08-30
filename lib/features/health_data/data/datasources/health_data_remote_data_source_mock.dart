import 'dart:math' as math;
import 'package:vitals/features/health_data/data/datasources/health_data_remote_data_source.dart';
import 'package:vitals/features/health_data/data/models/health_data_models.dart';

// Mock 实现 - 生成测试数据
class HealthDataRemoteDataSourceMock implements HealthDataRemoteDataSource {
  @override
  Future<List<BloodPressureRecordModel>> getBloodPressureRecords(
    String patientId, {
    TimeRangeModel? range,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    // 生成模拟数据
    return _generateMockBloodPressureData(range ?? TimeRangeModel.month);
  }

  @override
  Future<BloodPressureRecordModel> addBloodPressureRecord(
    String patientId,
    RecordHealthDataRequestModel request,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return BloodPressureRecordModel(
      id: 'bp_${DateTime.now().millisecondsSinceEpoch}',
      patientId: patientId,
      systolic: request.systolic ?? 0,
      diastolic: request.diastolic ?? 0,
      recordedAt: request.recordedAt ?? DateTime.now(),
      heartRate: request.heartRate,
      notes: request.notes,
      source: request.source ?? MeasurementSourceModel.manual,
      level: _calculateBloodPressureLevel(
        request.systolic ?? 0,
        request.diastolic ?? 0,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<ChartDataModel> getBloodPressureChartData(
    String patientId,
    TimeRangeModel range,
  ) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final records = await getBloodPressureRecords(patientId, range: range);
    return _generateChartData(records, range);
  }

  // =============================================================================
  // 私有辅助方法
  // =============================================================================

  List<BloodPressureRecordModel> _generateMockBloodPressureData(TimeRangeModel range) {
    final random = math.Random();
    final now = DateTime.now();
    final records = <BloodPressureRecordModel>[];

    int daysToGenerate = _getDaysForRange(range);

    for (int i = 0; i < daysToGenerate; i++) {
      final recordDate = now.subtract(Duration(days: i));

      // 生成随机血压值（有些现实性）
      final baseSystolic = 120 + random.nextInt(40); // 120-160
      final baseDiastolic = 80 + random.nextInt(25);  // 80-105

      // 添加一些变化
      final systolic = baseSystolic + random.nextInt(10) - 5;
      final diastolic = baseDiastolic + random.nextInt(8) - 4;

      records.add(BloodPressureRecordModel(
        id: 'bp_${recordDate.millisecondsSinceEpoch}_$i',
        patientId: 'patient_1',
        systolic: systolic.clamp(90, 180),
        diastolic: diastolic.clamp(60, 120),
        recordedAt: recordDate,
        heartRate: 60 + random.nextInt(40), // 60-100
        notes: i % 3 == 0 ? '早晨测量' : null,
        source: MeasurementSourceModel.manual,
        level: _calculateBloodPressureLevel(systolic, diastolic),
        createdAt: recordDate,
        updatedAt: recordDate,
      ));
    }

    return records..sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
  }

  ChartDataModel _generateChartData(
    List<BloodPressureRecordModel> records,
    TimeRangeModel range,
  ) {
    final dataPoints = records.map((record) {
      return DataPointModel(
        timestamp: record.recordedAt,
        value: record.systolic.toDouble(),
        secondaryValue: record.diastolic.toDouble(),
        metadata: {
          'heartRate': record.heartRate?.toString(),
          'level': record.level?.name,
        },
      );
    }).toList();

    // 计算统计数据
    final systolicValues = records.map((r) => r.systolic.toDouble()).toList();
    final minValue = systolicValues.isEmpty ? 0.0 : systolicValues.reduce(math.min);
    final maxValue = systolicValues.isEmpty ? 0.0 : systolicValues.reduce(math.max);
    final averageValue = systolicValues.isEmpty
        ? 0.0
        : systolicValues.reduce((a, b) => a + b) / systolicValues.length;

    // 简单趋势分析
    String? trend;
    if (systolicValues.length >= 3) {
      final recent = systolicValues.take(3).toList();
      final older = systolicValues.skip(3).take(3).toList();
      if (older.isNotEmpty) {
        final recentAvg = recent.reduce((a, b) => a + b) / recent.length;
        final olderAvg = older.reduce((a, b) => a + b) / older.length;
        if (recentAvg > olderAvg + 5) {
          trend = 'rising';
        } else if (recentAvg < olderAvg - 5) {
          trend = 'falling';
        } else {
          trend = 'stable';
        }
      }
    }

    return ChartDataModel(
      dataPoints: dataPoints,
      timeRange: range,
      minValue: minValue,
      maxValue: maxValue,
      averageValue: averageValue,
      trend: trend,
    );
  }

  BloodPressureLevelModel _calculateBloodPressureLevel(int systolic, int diastolic) {
    if (systolic >= 180 || diastolic >= 110) return BloodPressureLevelModel.crisis;
    if (systolic >= 140 || diastolic >= 90) return BloodPressureLevelModel.stage2;
    if (systolic >= 130 || diastolic >= 80) return BloodPressureLevelModel.stage1;
    if (systolic >= 120) return BloodPressureLevelModel.elevated;
    return BloodPressureLevelModel.normal;
  }

  int _getDaysForRange(TimeRangeModel range) {
    switch (range) {
      case TimeRangeModel.week:
        return 7;
      case TimeRangeModel.month:
        return 30;
      case TimeRangeModel.all:
        return 180; // 限制为6个月的数据
    }
  }
}