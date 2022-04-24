import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_sync/reminders/models/sync_group.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  factory Account({
    required String id,
    SyncGroup? selectedSyncGroup,
  }) = _Account;
  factory Account.fromJson(Map<String, Object?> json) => _$AccountFromJson(json);
}
