import 'package:freezed_annotation/freezed_annotation.dart';
import 'time_range.dart';

part 'chart_data.freezed.dart';
part 'chart_data.g.dart';

// 图表数据
@freezed
abstract class ChartData with _$ChartData {
  const factory ChartData({
    required List<DataPoint> dataPoints,
    required TimeRange timeRange,
    double? minValue,
    double? maxValue,
    double? averageValue,
    String? trend, // "rising", "falling", "stable"
  }) = _ChartData;

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);
}

// 数据点
@freezed
abstract class DataPoint with _$DataPoint {
  const factory DataPoint({
    required DateTime timestamp,
    required double value,
    double? secondaryValue, // 用于血压的舒张压
    Map<String, dynamic>? metadata,
  }) = _DataPoint;

  factory DataPoint.fromJson(Map<String, dynamic> json) =>
      _$DataPointFromJson(json);
}
