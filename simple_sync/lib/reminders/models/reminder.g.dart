// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reminder _$$_ReminderFromJson(Map<String, dynamic> json) => _$_Reminder(
      id: json['id'] as String,
      title: json['title'] as String,
      lastCompleteMsSinceEpoch: json['lastCompleteMsSinceEpoch'] as int,
      time: TimeOfDayX.fromJson(json['time'] as String),
    );

Map<String, dynamic> _$$_ReminderToJson(_$_Reminder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'lastCompleteMsSinceEpoch': instance.lastCompleteMsSinceEpoch,
      'time': TimeOfDayX.toJson(instance.time),
    };
