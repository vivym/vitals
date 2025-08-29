import 'dart:math' as math;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';

part 'generate_chart_data_usecase.g.dart';

// 生成图表数据用例
@riverpod
class GenerateChartDataUseCase extends _$GenerateChartDataUseCase {
  @override
  ChartData build() {
    throw UnimplementedError('Use execute method instead');
  }

  ChartData execute(List<BloodPressureRecord> records, TimeRange range) {
    if (records.isEmpty) {
      return const ChartData(dataPoints: [], timeRange: TimeRange.month);
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
