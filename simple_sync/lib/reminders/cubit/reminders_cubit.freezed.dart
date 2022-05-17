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
  Account? get user => throw _privateConstructorUsedError;
  SyncGroup? get syncGroup => throw _privateConstructorUsedError;
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
  $Res call({Account? user, SyncGroup? syncGroup, List<Reminder> reminders});

  $AccountCopyWith<$Res>? get user;
  $SyncGroupCopyWith<$Res>? get syncGroup;
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
    Object? syncGroup = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Account?,
      syncGroup: syncGroup == freezed
          ? _value.syncGroup
          : syncGroup // ignore: cast_nullable_to_non_nullable
              as SyncGroup?,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $SyncGroupCopyWith<$Res>? get syncGroup {
    if (_value.syncGroup == null) {
      return null;
    }

    return $SyncGroupCopyWith<$Res>(_value.syncGroup!, (value) {
      return _then(_value.copyWith(syncGroup: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReminderStateCopyWith<$Res>
    implements $RemindersStateCopyWith<$Res> {
  factory _$$_ReminderStateCopyWith(
          _$_ReminderState value, $Res Function(_$_ReminderState) then) =
      __$$_ReminderStateCopyWithImpl<$Res>;
  @override
  $Res call({Account? user, SyncGroup? syncGroup, List<Reminder> reminders});

  @override
  $AccountCopyWith<$Res>? get user;
  @override
  $SyncGroupCopyWith<$Res>? get syncGroup;
}

/// @nodoc
class __$$_ReminderStateCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res>
    implements _$$_ReminderStateCopyWith<$Res> {
  __$$_ReminderStateCopyWithImpl(
      _$_ReminderState _value, $Res Function(_$_ReminderState) _then)
      : super(_value, (v) => _then(v as _$_ReminderState));

  @override
  _$_ReminderState get _value => super._value as _$_ReminderState;

  @override
  $Res call({
    Object? user = freezed,
    Object? syncGroup = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_$_ReminderState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Account?,
      syncGroup: syncGroup == freezed
          ? _value.syncGroup
          : syncGroup // ignore: cast_nullable_to_non_nullable
              as SyncGroup?,
      reminders: reminders == freezed
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }
}

/// @nodoc

class _$_ReminderState implements _ReminderState {
  const _$_ReminderState(
      {required this.user,
      required this.syncGroup,
      required final List<Reminder> reminders})
      : _reminders = reminders;

  @override
  final Account? user;
  @override
  final SyncGroup? syncGroup;
  final List<Reminder> _reminders;
  @override
  List<Reminder> get reminders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'RemindersState(user: $user, syncGroup: $syncGroup, reminders: $reminders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReminderState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.syncGroup, syncGroup) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(syncGroup),
      const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  _$$_ReminderStateCopyWith<_$_ReminderState> get copyWith =>
      __$$_ReminderStateCopyWithImpl<_$_ReminderState>(this, _$identity);
}

abstract class _ReminderState implements RemindersState {
  const factory _ReminderState(
      {required final Account? user,
      required final SyncGroup? syncGroup,
      required final List<Reminder> reminders}) = _$_ReminderState;

  @override
  Account? get user => throw _privateConstructorUsedError;
  @override
  SyncGroup? get syncGroup => throw _privateConstructorUsedError;
  @override
  List<Reminder> get reminders => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReminderStateCopyWith<_$_ReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}
