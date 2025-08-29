import 'dart:math' as math;
import 'package:vitals/features/health_data/data/datasources/health_data_remote_data_source.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';

// Mock 实现 - 生成测试数据
class HealthDataRemoteDataSourceMock implements HealthDataRemoteDataSource {
  @override
  Future<List<BloodPressureRecord>> getBloodPressureRecords(
    String patientId, {
    TimeRange? range,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    // 生成模拟数据
    return _generateMockBloodPressureData(range ?? TimeRange.month);
  }

  @override
  Future<BloodPressureRecord> addBloodPressureRecord(
    String patientId,
    RecordHealthDataRequest request,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return request.when(
      bloodPressure: (systolic, diastolic, heartRate, recordedAt, notes) {
        return BloodPressureRecord(
          id: 'bp_${DateTime.now().millisecondsSinceEpoch}',
          patientId: patientId,
          systolic: systolic,
          diastolic: diastolic,
          recordedAt: recordedAt ?? DateTime.now(),
          heartRate: heartRate,
          notes: notes,
          source: MeasurementSource.manual,
        );
      },
      heartRate: (bpm, recordedAt, notes) {
        throw UnimplementedError('心率记录功能待实现');
      },
      weight: (weight, recordedAt, notes) {
        throw UnimplementedError('体重记录功能待实现');
      },
    );
  }

  @override
  Future<ChartData> getBloodPressureChartData(
    String patientId,
    TimeRange range,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final records = await getBloodPressureRecords(patientId, range: range);
    return _generateChartData(records, range);
  }

  List<BloodPressureRecord> _generateMockBloodPressureData(TimeRange range) {
    final records = <BloodPressureRecord>[];
    final now = DateTime.now();
    final days = range == TimeRange.all ? 90 : range.days;

    for (int i = 0; i < days; i += 2) {
      final date = now.subtract(Duration(days: i));

      // 模拟血压波动
      final baseSystolic = 125 + (math.Random().nextDouble() - 0.5) * 20;
      final baseDiastolic = 80 + (math.Random().nextDouble() - 0.5) * 15;

      records.add(BloodPressureRecord(
        id: 'bp_${date.millisecondsSinceEpoch}',
        patientId: 'patient_1',
        systolic: baseSystolic.round(),
        diastolic: baseDiastolic.round(),
        recordedAt: date,
        heartRate: (70 + (math.Random().nextDouble() - 0.5) * 20).round(),
        source: MeasurementSource.manual,
      ));
    }

    return records..sort((a, b) => b.recordedAt.compareTo(a.recordedAt));
  }

  ChartData _generateChartData(List<BloodPressureRecord> records, TimeRange range) {
    if (records.isEmpty) {
      return ChartData(dataPoints: [], timeRange: range);
    }

    final dataPoints = records.map((record) => DataPoint(
      timestamp: record.recordedAt,
      value: record.systolic.toDouble(),
      secondaryValue: record.diastolic.toDouble(),
    )).toList();

    // 计算统计信息
    final systolicValues = dataPoints.map((p) => p.value).toList();
    final avgSystolic = systolicValues.reduce((a, b) => a + b) / systolicValues.length;

    // 分析趋势
    final trend = _analyzeTrend(dataPoints);

    return ChartData(
      dataPoints: dataPoints,
      timeRange: range,
      minValue: systolicValues.reduce(math.min),
      maxValue: systolicValues.reduce(math.max),
      averageValue: avgSystolic,
      trend: trend,
    );
  }

  String _analyzeTrend(List<DataPoint> points) {
    if (points.length < 2) return 'stable';

    // 简单的线性趋势分析
    final first = points.last.value;
    final last = points.first.value;
    final difference = last - first;

    if (difference > 5) return 'rising';
    if (difference < -5) return 'falling';
    return 'stable';
  }
}
