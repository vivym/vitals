import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'medication_reminder.freezed.dart';
part 'medication_reminder.g.dart';

/// 用药提醒
@freezed
abstract class MedicationReminder with _$MedicationReminder {
  const factory MedicationReminder({
    required String id,
    required String patientId,
    required String medicationName,
    required String dosage,
    @JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson)
    required List<TimeOfDay> scheduledTimes,
    required List<int> weekdays, // 1-7 表示周一到周日
    DateTime? startDate,
    DateTime? endDate,
    @Default(true) bool isActive,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _MedicationReminder;

  factory MedicationReminder.fromJson(Map<String, dynamic> json) =>
      _$MedicationReminderFromJson(json);

  const MedicationReminder._();

  bool get isExpired {
    if (endDate == null) return false;
    return DateTime.now().isAfter(endDate!);
  }

  List<DateTime> getNextReminders(int count) {
    // 计算接下来的提醒时间
    final now = DateTime.now();
    final reminders = <DateTime>[];

    for (int day = 0; day < 7 && reminders.length < count; day++) {
      final date = now.add(Duration(days: day));
      final weekday = date.weekday;

      if (weekdays.contains(weekday)) {
        for (final time in scheduledTimes) {
          final reminderTime = DateTime(
            date.year, date.month, date.day,
            time.hour, time.minute,
          );

          if (reminderTime.isAfter(now)) {
            reminders.add(reminderTime);
          }
        }
      }
    }

    reminders.sort();
    return reminders.take(count).toList();
  }
}

// 自定义序列化方法
List<TimeOfDay> _timeOfDayListFromJson(List<dynamic> json) {
  return json.map((item) {
    if (item is String) {
      final parts = item.split(':');
      if (parts.length == 2) {
        return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }
    }
    return const TimeOfDay(hour: 8, minute: 0);
  }).toList();
}

List<String> _timeOfDayListToJson(List<TimeOfDay> times) {
  return times.map((time) =>
    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
  ).toList();
}
