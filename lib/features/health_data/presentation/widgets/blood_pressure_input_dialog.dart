import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/health_data/presentation/providers/blood_pressure_notifier.dart';
import 'package:vitals/features/health_data/presentation/providers/data_entry_notifier.dart';
import 'package:vitals/features/health_data/presentation/widgets/custom_numeric_keypad.dart';

// 数据录入对话框
class BloodPressureInputDialog extends ConsumerWidget {
  const BloodPressureInputDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryState = ref.watch(dataEntryNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头部
            _DialogHeader(),

            const SizedBox(height: 24),

            // 监测时间
            _MonitoringTime(),

            const SizedBox(height: 24),

            // 输入提示
            Text(
              '请记录收缩压/舒张压',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            // 自定义数字键盘输入
            _BloodPressureInputFields(),

            const SizedBox(height: 24),

            // 华为运动健康绑定
            _HealthIntegrationLink(),

            const SizedBox(height: 24),

            // 提交按钮
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: entryState.isValid ? () => _submitData(context, ref) : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: entryState.isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('确定'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData(BuildContext context, WidgetRef ref) async {
    final entryState = ref.read(dataEntryNotifierProvider);

    if (entryState.hasBloodPressureData) {
      await ref.read(bloodPressureNotifierProvider.notifier).addRecord(
        entryState.systolic!,
        entryState.diastolic!,
        heartRate: entryState.heartRate,
      );

      ref.read(dataEntryNotifierProvider.notifier).reset();
      Navigator.of(context).pop();
    }
  }
}

// 对话框头部
class _DialogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        Expanded(
          child: Center(
            child: Text(
              '记录血压',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SizedBox(width: 64), // 平衡布局
      ],
    );
  }
}

// 监测时间
class _MonitoringTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final timeString = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '监测时间',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          timeString,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// 血压输入字段
class _BloodPressureInputFields extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryState = ref.watch(dataEntryNotifierProvider);

    return Column(
      children: [
        // 血压显示
        Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '${entryState.systolic ?? 0} / ${entryState.diastolic ?? 0} mmHg',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // 数字键盘
        CustomNumericKeypad(
          onNumberPressed: (number) {
            // 处理数字输入
            _handleNumberInput(ref, number);
          },
          onBackspace: () {
            // 处理退格
            _handleBackspace(ref);
          },
          onNext: () {
            // 处理下一个
            _handleNext(ref);
          },
        ),

        // 验证错误
        if (entryState.validationErrors.isNotEmpty) ...[
          const SizedBox(height: 16),
          ...entryState.validationErrors.entries.map((entry) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              entry.value,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          )),
        ],
      ],
    );
  }

  void _handleNumberInput(WidgetRef ref, int number) {
    final entryState = ref.read(dataEntryNotifierProvider);

    // 简单的输入逻辑：先输入收缩压，再输入舒张压
    if (entryState.systolic == null || entryState.systolic == 0) {
      ref.read(dataEntryNotifierProvider.notifier).updateSystolic(number);
    } else if (entryState.diastolic == null || entryState.diastolic == 0) {
      ref.read(dataEntryNotifierProvider.notifier).updateDiastolic(number);
    }
  }

  void _handleBackspace(WidgetRef ref) {
    final entryState = ref.read(dataEntryNotifierProvider);

    if (entryState.diastolic != null && entryState.diastolic != 0) {
      ref.read(dataEntryNotifierProvider.notifier).updateDiastolic(null);
    } else if (entryState.systolic != null && entryState.systolic != 0) {
      ref.read(dataEntryNotifierProvider.notifier).updateSystolic(null);
    }
  }

  void _handleNext(WidgetRef ref) {
    final entryState = ref.read(dataEntryNotifierProvider);

    // 如果收缩压已输入，切换到舒张压
    if (entryState.systolic != null && entryState.systolic != 0) {
      // 可以添加一些视觉反馈
    }
  }
}

// 健康集成链接
class _HealthIntegrationLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 处理华为运动健康绑定
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.link,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            '绑定华为运动健康',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
