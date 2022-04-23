import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_sync/reminders/models/reminder.dart';

part 'reminders_state.dart';
part 'reminders_cubit.freezed.dart';

class RemindersCubit extends Cubit<RemindersState> {
  RemindersCubit()
      : super(
          RemindersState(
            user: null,
            reminders: List.empty(),
          ),
        ) {
    _observeAuthChanges();
  }

  Future<void> _observeAuthChanges() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          FirebaseAuth.instance.signInAnonymously();
        } else {
          emit(state.copyWith(user: user));
        }
      },
    );
  }

  Future<void> observeReminders() async {}

  Future<void> createReminder(Reminder reminder) async {}
}
