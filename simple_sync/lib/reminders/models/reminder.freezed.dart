// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get lastCompleteMsSinceEpoch =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(
      name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
  TimeOfDay get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      int lastCompleteMsSinceEpoch,
      @JsonKey(name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
          TimeOfDay time});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  final Reminder _value;
  // ignore: unused_field
  final $Res Function(Reminder) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? lastCompleteMsSinceEpoch = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastCompleteMsSinceEpoch: lastCompleteMsSinceEpoch == freezed
          ? _value.lastCompleteMsSinceEpoch
          : lastCompleteMsSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc
abstract class _$$_ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$$_ReminderCopyWith(
          _$_Reminder value, $Res Function(_$_Reminder) then) =
      __$$_ReminderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      int lastCompleteMsSinceEpoch,
      @JsonKey(name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
          TimeOfDay time});
}

/// @nodoc
class __$$_ReminderCopyWithImpl<$Res> extends _$ReminderCopyWithImpl<$Res>
    implements _$$_ReminderCopyWith<$Res> {
  __$$_ReminderCopyWithImpl(
      _$_Reminder _value, $Res Function(_$_Reminder) _then)
      : super(_value, (v) => _then(v as _$_Reminder));

  @override
  _$_Reminder get _value => super._value as _$_Reminder;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? lastCompleteMsSinceEpoch = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Reminder(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastCompleteMsSinceEpoch: lastCompleteMsSinceEpoch == freezed
          ? _value.lastCompleteMsSinceEpoch
          : lastCompleteMsSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reminder implements _Reminder {
  _$_Reminder(
      {required this.id,
      required this.title,
      required this.lastCompleteMsSinceEpoch,
      @JsonKey(name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
          required this.time});

  factory _$_Reminder.fromJson(Map<String, dynamic> json) =>
      _$$_ReminderFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int lastCompleteMsSinceEpoch;
// ignore: invalid_annotation_target
  @override
  @JsonKey(
      name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
  final TimeOfDay time;

  @override
  String toString() {
    return 'Reminder(id: $id, title: $title, lastCompleteMsSinceEpoch: $lastCompleteMsSinceEpoch, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reminder &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(
                other.lastCompleteMsSinceEpoch, lastCompleteMsSinceEpoch) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(lastCompleteMsSinceEpoch),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_ReminderCopyWith<_$_Reminder> get copyWith =>
      __$$_ReminderCopyWithImpl<_$_Reminder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReminderToJson(this);
  }
}

abstract class _Reminder implements Reminder {
  factory _Reminder(
      {required final String id,
      required final String title,
      required final int lastCompleteMsSinceEpoch,
      @JsonKey(name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
          required final TimeOfDay time}) = _$_Reminder;

  factory _Reminder.fromJson(Map<String, dynamic> json) = _$_Reminder.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get lastCompleteMsSinceEpoch => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(
      name: 'time', toJson: TimeOfDayX.toJson, fromJson: TimeOfDayX.fromJson)
  TimeOfDay get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReminderCopyWith<_$_Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}
