part of 'reminders_cubit.dart';

@freezed
class RemindersState with _$RemindersState {
  const factory RemindersState({
    required Account? user,
    required SyncGroup? syncGroup,
    required List<Reminder> reminders,
    @Default(<PendingNotificationRequest>[]) List<PendingNotificationRequest> notifications,
  }) = _ReminderState;
}
