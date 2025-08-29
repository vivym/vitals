import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
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
    return Container(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: TimeRange.values.map((range) {
          final isSelected = range == selectedRange;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () {
                ref.read(bloodPressureNotifierProvider.notifier)
                    .changeTimeRange(range);
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Text(
                  range.label,
                  style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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
