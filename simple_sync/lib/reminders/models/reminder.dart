import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';

@freezed
class Reminder with _$Reminder {
  factory Reminder({required String title, required int time}) = _Reminder;
}
