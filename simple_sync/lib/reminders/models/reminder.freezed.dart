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

/// @nodoc
mixin _$Reminder {
  String get title => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res>;
  $Res call({String title, int time});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  final Reminder _value;
  // ignore: unused_field
  final $Res Function(Reminder) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) then) =
      __$ReminderCopyWithImpl<$Res>;
  @override
  $Res call({String title, int time});
}

/// @nodoc
class __$ReminderCopyWithImpl<$Res> extends _$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(_Reminder _value, $Res Function(_Reminder) _then)
      : super(_value, (v) => _then(v as _Reminder));

  @override
  _Reminder get _value => super._value as _Reminder;

  @override
  $Res call({
    Object? title = freezed,
    Object? time = freezed,
  }) {
    return _then(_Reminder(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Reminder implements _Reminder {
  _$_Reminder({required this.title, required this.time});

  @override
  final String title;
  @override
  final int time;

  @override
  String toString() {
    return 'Reminder(title: $title, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reminder &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$ReminderCopyWith<_Reminder> get copyWith =>
      __$ReminderCopyWithImpl<_Reminder>(this, _$identity);
}

abstract class _Reminder implements Reminder {
  factory _Reminder({required final String title, required final int time}) =
      _$_Reminder;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  int get time => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReminderCopyWith<_Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}
