// Presentation层的图表数据模型
// 这些模型用于UI显示，不依赖于数据层

/// 图表数据点
class ChartDataPoint {
  final DateTime timestamp;
  final double value;
  final double? secondaryValue;
  final Map<String, dynamic>? metadata;

  const ChartDataPoint({
    required this.timestamp,
    required this.value,
    this.secondaryValue,
    this.metadata,
  });
}

/// 图表数据
class ChartData {
  final List<ChartDataPoint> dataPoints;
  final String timeRangeLabel;
  final double? minValue;
  final double? maxValue;
  final double? averageValue;
  final String? trend;

  const ChartData({
    required this.dataPoints,
    required this.timeRangeLabel,
    this.minValue,
    this.maxValue,
    this.averageValue,
    this.trend,
  });
}

/// 血压记录 (用于UI显示)
class BloodPressureRecord {
  final String id;
  final int systolic;
  final int diastolic;
  final DateTime recordedAt;
  final int? heartRate;
  final String? notes;
  final String? levelText;
  final String? sourceText;
  final String? calculatedLevel;  // 添加计算的血压等级

  const BloodPressureRecord({
    required this.id,
    required this.systolic,
    required this.diastolic,
    required this.recordedAt,
    this.heartRate,
    this.notes,
    this.levelText,
    this.sourceText,
    this.calculatedLevel,
  });
}
