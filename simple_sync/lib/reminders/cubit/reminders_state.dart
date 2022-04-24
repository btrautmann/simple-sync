part of 'reminders_cubit.dart';

@freezed
class RemindersState with _$RemindersState {
  const factory RemindersState({
    required Account? user,
    required List<Reminder> reminders,
  }) = _ReminderState;
}
