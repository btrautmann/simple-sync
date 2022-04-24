// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String,
      selectedSyncGroup: json['selectedSyncGroup'] == null
          ? null
          : SyncGroup.fromJson(
              json['selectedSyncGroup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selectedSyncGroup': instance.selectedSyncGroup,
    };
