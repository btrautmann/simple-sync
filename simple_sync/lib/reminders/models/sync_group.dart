import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_group.freezed.dart';
part 'sync_group.g.dart';

@freezed
class SyncGroup with _$SyncGroup {
  factory SyncGroup({
    required String name,
    required String id,
  }) = _SyncGroup;

  factory SyncGroup.fromJson(Map<String, Object?> json) => _$SyncGroupFromJson(json);
}
