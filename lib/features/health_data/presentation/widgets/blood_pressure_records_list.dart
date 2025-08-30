import 'package:flutter/material.dart';
import 'package:vitals/features/health_data/presentation/models/chart_models.dart';

// 血压记录列表
class BloodPressureRecordsList extends StatelessWidget {
  const BloodPressureRecordsList({super.key, required this.records});

  final List<BloodPressureRecord> records;

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Text('暂无记录'),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return _RecordItem(record: record);
      },
    );
  }
}

// 记录项
class _RecordItem extends StatelessWidget {
  const _RecordItem({required this.record});

  final BloodPressureRecord record;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 左侧日期部分
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(record.recordedAt),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 16),

            // 中间内容部分
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${record.systolic}/${record.diastolic}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '记录时间: ${_formatDetailTime(record.recordedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),

            // 右侧等级标签
            _BloodPressureLevelChip(level: record.calculatedLevel ?? '未知'),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.month.toString().padLeft(2, '0')}月${dateTime.day.toString().padLeft(2, '0')}日';
  }

  String _formatDetailTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }


}

// 血压水平标签
class _BloodPressureLevelChip extends StatelessWidget {
  const _BloodPressureLevelChip({required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    final (text, color) = _getLevelInfo(level);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  (String, Color) _getLevelInfo(dynamic level) {
    switch (level.toString()) {
      case 'BloodPressureLevel.normal':
        return ('正常', Colors.green);
      case 'BloodPressureLevel.elevated':
        return ('偏高', Colors.orange);
      case 'BloodPressureLevel.stage1':
        return ('1级', Colors.red);
      case 'BloodPressureLevel.stage2':
        return ('2级', Colors.red);
      case 'BloodPressureLevel.crisis':
        return ('危机', Colors.purple);
      default:
        return ('未知', Colors.grey);
    }
  }
}
