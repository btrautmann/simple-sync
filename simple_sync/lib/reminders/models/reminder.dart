import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
class Reminder with _$Reminder {
  factory Reminder({
    required String title,
    @JsonKey(
      name: 'time',
      toJson: TimeOfDayX.toJson,
      fromJson: TimeOfDayX.fromJson,
    )
        required TimeOfDay time,
  }) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) => _$ReminderFromJson(json);
}

extension TimeOfDayX on TimeOfDay {
  static String toJson(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour}:${timeOfDay.minute}';
  }

  static TimeOfDay fromJson(String json) {
    final splits = json.split(':');
    return TimeOfDay(
      hour: int.parse(splits[0]),
      minute: int.parse(splits[1]),
    );
  }
}
