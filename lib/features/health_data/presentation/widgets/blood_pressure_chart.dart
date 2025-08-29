import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';

// 血压趋势图表
class BloodPressureChart extends StatelessWidget {
  const BloodPressureChart({super.key, required this.chartData});

  final ChartData chartData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '血压趋势',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            // fl_chart 图表
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: _buildTitlesData(),
                  lineBarsData: _buildLineBarsData(),
                  borderData: FlBorderData(show: true),
                  minX: chartData.dataPoints.isNotEmpty
                      ? chartData.dataPoints.first.timestamp.millisecondsSinceEpoch.toDouble()
                      : 0,
                  maxX: chartData.dataPoints.isNotEmpty
                      ? chartData.dataPoints.last.timestamp.millisecondsSinceEpoch.toDouble()
                      : 0,
                  minY: (chartData.minValue ?? 60) - 10,
                  maxY: (chartData.maxValue ?? 140) + 10,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 统计信息
            _ChartStatistics(chartData: chartData),
          ],
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData() {
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
          getTitlesWidget: (value, meta) {
            final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
            return Text(
              '${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 10),
            );
          },
        ),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  List<LineChartBarData> _buildLineBarsData() {
    if (chartData.dataPoints.isEmpty) return [];

    return [
      // 收缩压线
      LineChartBarData(
        spots: chartData.dataPoints.map((point) => FlSpot(
          point.timestamp.millisecondsSinceEpoch.toDouble(),
          point.value,
        )).toList(),
        color: Colors.red,
        barWidth: 2,
        dotData: const FlDotData(show: true),
        isCurved: true,
      ),
      // 舒张压线
      LineChartBarData(
        spots: chartData.dataPoints.map((point) => FlSpot(
          point.timestamp.millisecondsSinceEpoch.toDouble(),
          point.secondaryValue ?? 0,
        )).toList(),
        color: Colors.blue,
        barWidth: 2,
        dotData: const FlDotData(show: true),
        isCurved: true,
      ),
    ];
  }
}

// 图表统计信息
class _ChartStatistics extends StatelessWidget {
  const _ChartStatistics({required this.chartData});

  final ChartData chartData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatItem(
          label: '最低',
          value: '${chartData.minValue?.toInt() ?? 0}',
          color: Colors.blue,
        ),
        _StatItem(
          label: '平均',
          value: '${chartData.averageValue?.toInt() ?? 0}',
          color: Colors.orange,
        ),
        _StatItem(
          label: '最高',
          value: '${chartData.maxValue?.toInt() ?? 0}',
          color: Colors.red,
        ),
        _StatItem(
          label: '趋势',
          value: _getTrendText(chartData.trend),
          color: _getTrendColor(chartData.trend),
        ),
      ],
    );
  }

  String _getTrendText(String? trend) {
    switch (trend) {
      case 'rising':
        return '上升';
      case 'falling':
        return '下降';
      case 'stable':
        return '稳定';
      default:
        return '未知';
    }
  }

  Color _getTrendColor(String? trend) {
    switch (trend) {
      case 'rising':
        return Colors.red;
      case 'falling':
        return Colors.green;
      case 'stable':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

// 统计项
class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
