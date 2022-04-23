// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reminders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemindersState {
  User? get user => throw _privateConstructorUsedError;
  List<Reminder> get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemindersStateCopyWith<RemindersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersStateCopyWith<$Res> {
  factory $RemindersStateCopyWith(
          RemindersState value, $Res Function(RemindersState) then) =
      _$RemindersStateCopyWithImpl<$Res>;
  $Res call({User? user, List<Reminder> reminders});
}

/// @nodoc
class _$RemindersStateCopyWithImpl<$Res>
    implements $RemindersStateCopyWith<$Res> {
  _$RemindersStateCopyWithImpl(this._value, this._then);

  final RemindersState _value;
  // ignore: unused_field
  final $Res Function(RemindersState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }
}

/// @nodoc
abstract class _$ReminderStateCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$ReminderStateCopyWith(
          _ReminderState value, $Res Function(_ReminderState) then) =
      __$ReminderStateCopyWithImpl<$Res>;
  @override
  $Res call({User? user, List<Reminder> reminders});
}

/// @nodoc
class __$ReminderStateCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res>
    implements _$ReminderStateCopyWith<$Res> {
  __$ReminderStateCopyWithImpl(
      _ReminderState _value, $Res Function(_ReminderState) _then)
      : super(_value, (v) => _then(v as _ReminderState));

  @override
  _ReminderState get _value => super._value as _ReminderState;

  @override
  $Res call({
    Object? user = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_ReminderState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }
}

/// @nodoc

class _$_ReminderState implements _ReminderState {
  const _$_ReminderState(
      {required this.user, required final List<Reminder> reminders})
      : _reminders = reminders;

  @override
  final User? user;
  final List<Reminder> _reminders;
  @override
  List<Reminder> get reminders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'RemindersState(user: $user, reminders: $reminders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReminderState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.reminders, reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(reminders));

  @JsonKey(ignore: true)
  @override
  _$ReminderStateCopyWith<_ReminderState> get copyWith =>
      __$ReminderStateCopyWithImpl<_ReminderState>(this, _$identity);
}

abstract class _ReminderState implements RemindersState {
  const factory _ReminderState(
      {required final User? user,
      required final List<Reminder> reminders}) = _$_ReminderState;

  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  List<Reminder> get reminders => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReminderStateCopyWith<_ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}
