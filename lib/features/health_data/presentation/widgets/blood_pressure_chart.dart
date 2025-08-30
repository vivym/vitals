import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/chart_models.dart';

// 血压趋势图表
class BloodPressureChart extends StatelessWidget {
  const BloodPressureChart({super.key, required this.chartData});

  final ChartData chartData;

  @override
  Widget build(BuildContext context) {
    // 纯图表渲染，不包含Card、标题或统计信息
    final bounds = _computeYBounds();
    final double minX = chartData.dataPoints.isNotEmpty
        ? chartData.dataPoints.first.timestamp.millisecondsSinceEpoch.toDouble()
        : 0.0;
    final double maxX = chartData.dataPoints.isNotEmpty
        ? chartData.dataPoints.last.timestamp.millisecondsSinceEpoch.toDouble()
        : 0.0;
    final interval = maxX > minX ? (maxX - minX) / 4.0 : 1.0;
    return SizedBox.expand(
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: true),
          titlesData: _buildTitlesData(minX, maxX, interval),
          lineBarsData: _buildLineBarsData(),
          // 去掉图表黑色边框
          borderData: FlBorderData(show: false),
          minX: minX.toDouble(),
          maxX: maxX.toDouble(),
          minY: bounds.$1,
          maxY: bounds.$2,
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData(double minX, double maxX, double interval) {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) {
            return Text(
              value.toInt().toString(),
              style: const TextStyle(fontSize: 10),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) => _buildDateLabel(value, minX, maxX),
        ),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  Widget _buildDateLabel(double value, double minX, double maxX) {
    // 超出范围不显示
    if (value < minX || value > maxX) {
      return const SizedBox.shrink();
    }

    // 计算合适的显示间距，避免相邻日期重叠
    final totalDays = (maxX - minX) / (24 * 60 * 60 * 1000); // 总天数
    final minDisplayInterval = totalDays > 7 ? 2 : 1; // 超过7天则至少间隔2天显示

    final currentDate = DateTime.fromMillisecondsSinceEpoch(value.toInt());
    final startDate = DateTime.fromMillisecondsSinceEpoch(minX.toInt());

    // 计算当前日期与起始日期的天数差
    final daysDiff = currentDate.difference(startDate).inDays;

    // 只显示符合间隔要求的日期
    if (daysDiff % minDisplayInterval != 0) {
      return const SizedBox.shrink();
    }

    return Text(
      '${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 10),
    );
  }

  /// 自动计算Y轴范围，避免越界
  (double, double) _computeYBounds() {
    if (chartData.dataPoints.isEmpty) {
      return (0, 1);
    }

    final values = <double>[];
    for (final p in chartData.dataPoints) {
      values.add(p.value);
      if (p.secondaryValue != null) values.add(p.secondaryValue!);
    }

    var minV = values.reduce(math.min);
    var maxV = values.reduce(math.max);

    if (maxV == minV) {
      // 同值时，给一个对称范围
      minV -= 10;
      maxV += 10;
    } else {
      final padding = math.max(5, (maxV - minV) * 0.1);
      minV -= padding;
      maxV += padding;
    }

    // 血压不应为负数
    minV = math.max(0, minV);
    return (minV, maxV);
  }

  List<LineChartBarData> _buildLineBarsData() {
    if (chartData.dataPoints.isEmpty) return [];

    return [
      // 收缩压线（折线，无圆点）
      LineChartBarData(
        spots: chartData.dataPoints
            .map((point) => FlSpot(
                  point.timestamp.millisecondsSinceEpoch.toDouble(),
                  point.value,
                ))
            .toList(),
        color: Colors.red,
        barWidth: 2,
        dotData: const FlDotData(show: false),
        isCurved: false,
      ),
      // 舒张压线（折线，无圆点）
      LineChartBarData(
        spots: chartData.dataPoints
            .map((point) => FlSpot(
                  point.timestamp.millisecondsSinceEpoch.toDouble(),
                  point.secondaryValue ?? 0,
                ))
            .toList(),
        color: Colors.blue,
        barWidth: 2,
        dotData: const FlDotData(show: false),
        isCurved: false,
      ),
    ];
  }
}

