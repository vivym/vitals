import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/health_data/presentation/providers/blood_pressure_notifier.dart';
import 'package:vitals/features/health_data/presentation/models/health_data_states.dart';
import 'package:vitals/features/health_data/presentation/models/chart_models.dart' as presentation;

import 'package:vitals/features/health_data/presentation/widgets/blood_pressure_input_dialog.dart';
import 'package:vitals/features/health_data/presentation/widgets/blood_pressure_records_list.dart';
import 'package:vitals/features/health_data/presentation/widgets/time_range_selector.dart';
import 'package:vitals/features/health_data/presentation/widgets/blood_pressure_chart.dart';

// 血压详情页面
class BloodPressureScreen extends ConsumerWidget {
  const BloodPressureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodPressureState = ref.watch(bloodPressureNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('血压详情'),
        automaticallyImplyLeading: true, // 确保显示返回按钮
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(bloodPressureNotifierProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddRecordDialog(context),
        child: const Icon(Icons.add),
      ),
      body: bloodPressureState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: SelectableText.rich(
            TextSpan(
              text: '加载失败: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
        data: (state) => _BloodPressureContent(state: state),
      ),
    );
  }

  void _showAddRecordDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const BloodPressureInputDialog(),
    );
  }
}

// 血压内容视图
class _BloodPressureContent extends StatelessWidget {
  const _BloodPressureContent({required this.state});

  final BloodPressureState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 时间范围选择器
        Container(
          padding: const EdgeInsets.all(16),
          child: const TimeRangeSelector(),
        ),

        // 可滚动内容
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              // 刷新逻辑
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                // 趋势图表
                _ChartContent(
                  chartData: state.chartData,
                  isLoading: state.isLoading,
                ),
                const SizedBox(height: 16),

                // 历史记录标题
                Text(
                  '历史记录',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),

                // 历史记录列表
                BloodPressureRecordsList(records: state.filteredRecords),

                // 底部间距，避免被FAB遮挡
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



// 图表内容
class _ChartContent extends StatelessWidget {
  const _ChartContent({
    required this.chartData,
    this.isLoading = false,
  });

  final presentation.ChartData? chartData;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading || chartData == null) {
      return _buildLoadingPlaceholder(context);
    }
    return _buildChart(context);
  }

  Widget _buildChart(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 真正的图表内容
            SizedBox(
              height: 220,
              child: _buildRealChart(context),
            ),
            const SizedBox(height: 12),
            _buildStatistics(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRealChart(BuildContext context) {
    // 使用真正的图表组件
    return BloodPressureChart(chartData: chartData!);
  }

  Widget _buildStatistics(BuildContext context) {
    final min = chartData?.minValue?.toInt() ?? 0;
    final avg = chartData?.averageValue?.toInt() ?? 0;
    final max = chartData?.maxValue?.toInt() ?? 0;
    final trend = _trendText(chartData?.trend);
    final trendColor = _trendColor(chartData?.trend);

    Widget item(String label, String value, Color color) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        item('最低', '$min', Colors.blue),
        item('平均', '$avg', Colors.orange),
        item('最高', '$max', Colors.red),
        item('趋势', trend, trendColor),
      ],
    );
  }

  String _trendText(String? trend) {
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

  Color _trendColor(String? trend) {
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

  Widget _buildLoadingPlaceholder(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            '正在加载图表数据...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

// 统计数据项已移除（图表组件内部不再显示重复统计）
