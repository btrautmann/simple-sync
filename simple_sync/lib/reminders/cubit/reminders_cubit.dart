import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_sync/account/models/account.dart';
import 'package:simple_sync/reminders/models/reminder.dart';
import 'package:simple_sync/reminders/models/sync_group.dart';

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

  final _firestore = FirebaseFirestore.instance;

  Future<void> _observeAuthChanges() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          FirebaseAuth.instance.signInAnonymously();
        } else {
          _onLogin(user);
        }
      },
    );
  }

  Future<void> _onLogin(User user) async {
    final accountDoc = await _firestore.collection('accounts').doc(user.uid).get();
    final data = accountDoc.data();
    if (data == null) {
      final account = Account(id: user.uid);
      await _firestore.collection('accounts').doc(user.uid).set(
            account.toJson(),
            SetOptions(merge: true),
          );
      emit(state.copyWith(user: account));
    } else {
      final account = Account.fromJson(data);
      emit(state.copyWith(user: account));
    }
  }

  Future<void> observeReminders() async {}

  Future<void> createReminder(Reminder reminder) async {}

  Future<void> createSyncGroup(SyncGroup reminder) async {}
}
