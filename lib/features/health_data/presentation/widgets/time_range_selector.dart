import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/health_data/presentation/models/health_data_states.dart';
import 'package:vitals/features/health_data/presentation/providers/blood_pressure_notifier.dart';

// 时间范围选择器
class TimeRangeSelector extends ConsumerWidget {
  const TimeRangeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodPressureState = ref.watch(bloodPressureNotifierProvider);

    return bloodPressureState.when(
      loading: () => const SizedBox(),
      error: (_, __) => const SizedBox(),
      data: (state) => _TimeRangeTabs(selectedRange: state.selectedRange),
    );
  }
}

// 时间范围标签页
class _TimeRangeTabs extends ConsumerWidget {
  const _TimeRangeTabs({required this.selectedRange});

  final TimeRange selectedRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: TimeRange.values.map((range) {
          final isSelected = range == selectedRange;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    ref.read(bloodPressureNotifierProvider.notifier)
                        .changeTimeRange(range, 'patient_1'); // 临时硬编码，实际应从auth状态获取
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        range.label,
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                          fontSize: 15,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
