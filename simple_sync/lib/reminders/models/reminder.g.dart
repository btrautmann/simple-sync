// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reminder _$$_ReminderFromJson(Map<String, dynamic> json) => _$_Reminder(
      title: json['title'] as String,
      time: TimeOfDayX.fromJson(json['time'] as String),
    );

Map<String, dynamic> _$$_ReminderToJson(_$_Reminder instance) =>
    <String, dynamic>{
      'title': instance.title,
      'time': TimeOfDayX.toJson(instance.time),
    };
