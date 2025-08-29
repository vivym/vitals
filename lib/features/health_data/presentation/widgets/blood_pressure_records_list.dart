import 'package:flutter/material.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';

// 血压记录列表
class BloodPressureRecordsList extends StatelessWidget {
  const BloodPressureRecordsList({super.key, required this.records});

  final List<dynamic> records; // 临时使用dynamic

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

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '历史记录',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: records.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final record = records[index];
              return _RecordItem(record: record);
            },
          ),
        ],
      ),
    );
  }
}

// 记录项
class _RecordItem extends StatelessWidget {
  const _RecordItem({required this.record});

  final dynamic record; // 临时使用dynamic

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          Icons.calendar_today,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      title: Text(
        '${record.systolic}/${record.diastolic} mmHg',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '记录时间: ${_formatTime(record.recordedAt)}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: _BloodPressureLevelChip(level: record.calculatedLevel),
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.month.toString().padLeft(2, '0')}月${dateTime.day.toString().padLeft(2, '0')}日 ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

// 血压水平标签
class _BloodPressureLevelChip extends StatelessWidget {
  const _BloodPressureLevelChip({required this.level});

  final dynamic level; // 临时使用dynamic

  @override
  Widget build(BuildContext context) {
    final (text, color) = _getLevelInfo(level);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
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
