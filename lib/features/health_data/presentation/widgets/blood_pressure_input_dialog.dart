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



          ],
        ),
      ),
    );
  }


}

// 对话框头部
class _DialogHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryState = ref.watch(dataEntryNotifierProvider);
    final isValid = entryState.systolic != null &&
                   entryState.systolic! > 0 &&
                   entryState.diastolic != null &&
                   entryState.diastolic! > 0;

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
        TextButton(
          onPressed: isValid ? () => _handleSubmit(context, ref) : null,
          child: const Text('确定'),
        ),
      ],
    );
  }

  void _handleSubmit(BuildContext context, WidgetRef ref) async {
    final entryState = ref.read(dataEntryNotifierProvider);

    if (entryState.hasBloodPressureData) {
      await ref.read(bloodPressureNotifierProvider.notifier).recordBloodPressure(
        patientId: 'patient_1', // 临时硬编码，实际应从auth状态获取
        systolic: entryState.systolic!,
        diastolic: entryState.diastolic!,
        heartRate: entryState.heartRate,
        notes: null,
        recordedAt: DateTime.now(),
      );

      ref.read(dataEntryNotifierProvider.notifier).clearForm();
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
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
              color: Colors.grey.shade300, // 浅灰色边框
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
                    child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32, // 明确设置更大的字体大小
            ),
            children: [
              // 收缩压部分
              TextSpan(
                text: '${entryState.systolic ?? 0}',
                style: TextStyle(
                  fontSize: !entryState.isDiastolicMode ? 36 : 32, // 当前状态字体更大
                  color: !entryState.isDiastolicMode ? Colors.green : Theme.of(context).colorScheme.primary, // 当前状态为绿色
                  height: 1.2, // 增加行高
                ),
              ),
              // 分隔符
              const TextSpan(text: ' / '),
              // 舒张压部分
              TextSpan(
                text: '${entryState.diastolic ?? 0}',
                style: TextStyle(
                  fontSize: entryState.isDiastolicMode ? 36 : 32, // 当前状态字体更大
                  color: entryState.isDiastolicMode ? Colors.green : Theme.of(context).colorScheme.primary, // 当前状态为绿色
                  height: 1.2, // 增加行高
                ),
              ),
              // 单位
              const TextSpan(text: ' mmHg'),
            ],
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

        // 错误信息区域（始终显示）
        const SizedBox(height: 16),
        _ErrorDisplayArea(),
      ],
    );
  }

  void _handleNumberInput(WidgetRef ref, int number) {
    final entryState = ref.read(dataEntryNotifierProvider);

    // 根据当前输入模式决定输入收缩压还是舒张压
    if (!entryState.isDiastolicMode) {
      // 输入收缩压
      final currentSystolic = entryState.systolic ?? 0;
      final newSystolic = currentSystolic * 10 + number;
      if (newSystolic <= 999) { // 限制最大值
        ref.read(dataEntryNotifierProvider.notifier).updateSystolic(newSystolic);
      }
    } else {
      // 输入舒张压
      final currentDiastolic = entryState.diastolic ?? 0;
      final newDiastolic = currentDiastolic * 10 + number;
      if (newDiastolic <= 999) { // 限制最大值
        ref.read(dataEntryNotifierProvider.notifier).updateDiastolic(newDiastolic);
      }
    }
  }

  void _handleBackspace(WidgetRef ref) {
    final entryState = ref.read(dataEntryNotifierProvider);

    if (entryState.isDiastolicMode) {
      // 当前在舒张压模式，删除舒张压
      if (entryState.diastolic != null && entryState.diastolic! > 0) {
        final newDiastolic = entryState.diastolic! ~/ 10;
        ref.read(dataEntryNotifierProvider.notifier).updateDiastolic(newDiastolic == 0 ? 0 : newDiastolic);
      } else {
        // 舒张压为0，切换回收缩压输入模式
        ref.read(dataEntryNotifierProvider.notifier).setInputMode(false);
      }
    } else {
      // 当前在收缩压模式，删除收缩压
      if (entryState.systolic != null && entryState.systolic! > 0) {
        final newSystolic = entryState.systolic! ~/ 10;
        ref.read(dataEntryNotifierProvider.notifier).updateSystolic(newSystolic == 0 ? null : newSystolic);
      }
    }
  }

  void _handleNext(WidgetRef ref) {
    final entryState = ref.read(dataEntryNotifierProvider);

    if (!entryState.isDiastolicMode) {
      // 当前在输入收缩压，切换到舒张压模式
      if (entryState.systolic != null && entryState.systolic! > 0) {
        ref.read(dataEntryNotifierProvider.notifier).setInputMode(true);
        // 如果舒张压还没有值，初始化为0
        if (entryState.diastolic == null) {
          ref.read(dataEntryNotifierProvider.notifier).updateDiastolic(0);
        }
      }
    } else {
      // 当前在输入舒张压，切换回收缩压模式
      ref.read(dataEntryNotifierProvider.notifier).setInputMode(false);
    }
  }
}

// 错误显示区域（始终显示占位符防止高度变化）
class _ErrorDisplayArea extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryState = ref.watch(dataEntryNotifierProvider);

    // 如果没有错误，显示占位符保持高度一致
    if (entryState.validationErrors.isEmpty) {
      return const SizedBox(
        height: 40, // 与错误信息框高度一致
        child: Center(
          child: Text(
            ' ', // 空格字符，保持视觉一致性
            style: TextStyle(color: Colors.transparent),
          ),
        ),
      );
    }

    // 显示错误信息
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.error),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        entryState.validationErrors.values.first, // 显示第一个错误
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 14,
        ),
      ),
    );
  }
}


