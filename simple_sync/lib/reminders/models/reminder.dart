import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@freezed
class Reminder with _$Reminder {
  factory Reminder({required String title, required int time}) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) => _$ReminderFromJson(json);
}
