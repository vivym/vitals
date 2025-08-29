import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/health_data/presentation/providers/blood_pressure_notifier.dart';
import 'package:vitals/features/health_data/presentation/widgets/blood_pressure_chart.dart';
import 'package:vitals/features/health_data/presentation/widgets/blood_pressure_input_dialog.dart';
import 'package:vitals/features/health_data/presentation/widgets/blood_pressure_records_list.dart';
import 'package:vitals/features/health_data/presentation/widgets/time_range_selector.dart';

// 血压详情页面
class BloodPressureScreen extends ConsumerWidget {
  const BloodPressureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodPressureState = ref.watch(bloodPressureNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('血压详情'),
        actions: [
          const TimeRangeSelector(),
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
              style: TextStyle(color: Theme.of(context).colorScheme.error),
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

  final dynamic state; // 临时使用dynamic，等状态类生成后修复

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // 刷新逻辑
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 最新数据卡片
          if (state.latestRecord != null)
            _LatestRecordCard(record: state.latestRecord),

          const SizedBox(height: 16),

          // 趋势图表
          if (state.chartData != null)
            BloodPressureChart(chartData: state.chartData),

          const SizedBox(height: 16),

          // 历史记录列表
          BloodPressureRecordsList(records: state.filteredRecords),
        ],
      ),
    );
  }
}

// 最新记录卡片
class _LatestRecordCard extends StatelessWidget {
  const _LatestRecordCard({required this.record});

  final dynamic record; // 临时使用dynamic

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '最新记录',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  '${record.systolic}/${record.diastolic} mmHg',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '记录时间: ${_formatDateTime(record.recordedAt)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.month.toString().padLeft(2, '0')}月${dateTime.day.toString().padLeft(2, '0')}日 ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

// 时间范围选择器
class _TimeRangeSelector extends ConsumerWidget {
  const _TimeRangeSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // 处理时间范围选择
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'week', child: Text('近一周')),
        const PopupMenuItem(value: 'month', child: Text('近一月')),
        const PopupMenuItem(value: 'all', child: Text('全部')),
      ],
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('近一月'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
