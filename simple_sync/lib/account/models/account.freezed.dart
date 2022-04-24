// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get id => throw _privateConstructorUsedError;
  SyncGroup? get selectedSyncGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res>;
  $Res call({String id, SyncGroup? selectedSyncGroup});

  $SyncGroupCopyWith<$Res>? get selectedSyncGroup;
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  final Account _value;
  // ignore: unused_field
  final $Res Function(Account) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? selectedSyncGroup = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSyncGroup: selectedSyncGroup == freezed
          ? _value.selectedSyncGroup
          : selectedSyncGroup // ignore: cast_nullable_to_non_nullable
              as SyncGroup?,
    ));
  }

  @override
  $SyncGroupCopyWith<$Res>? get selectedSyncGroup {
    if (_value.selectedSyncGroup == null) {
      return null;
    }

    return $SyncGroupCopyWith<$Res>(_value.selectedSyncGroup!, (value) {
      return _then(_value.copyWith(selectedSyncGroup: value));
    });
  }
}

/// @nodoc
abstract class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) then) =
      __$AccountCopyWithImpl<$Res>;
  @override
  $Res call({String id, SyncGroup? selectedSyncGroup});

  @override
  $SyncGroupCopyWith<$Res>? get selectedSyncGroup;
}

/// @nodoc
class __$AccountCopyWithImpl<$Res> extends _$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(_Account _value, $Res Function(_Account) _then)
      : super(_value, (v) => _then(v as _Account));

  @override
  _Account get _value => super._value as _Account;

  @override
  $Res call({
    Object? id = freezed,
    Object? selectedSyncGroup = freezed,
  }) {
    return _then(_Account(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSyncGroup: selectedSyncGroup == freezed
          ? _value.selectedSyncGroup
          : selectedSyncGroup // ignore: cast_nullable_to_non_nullable
              as SyncGroup?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Account implements _Account {
  _$_Account({required this.id, this.selectedSyncGroup});

  factory _$_Account.fromJson(Map<String, dynamic> json) =>
      _$$_AccountFromJson(json);

  @override
  final String id;
  @override
  final SyncGroup? selectedSyncGroup;

  @override
  String toString() {
    return 'Account(id: $id, selectedSyncGroup: $selectedSyncGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.selectedSyncGroup, selectedSyncGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(selectedSyncGroup));

  @JsonKey(ignore: true)
  @override
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountToJson(this);
  }
}

abstract class _Account implements Account {
  factory _Account(
      {required final String id,
      final SyncGroup? selectedSyncGroup}) = _$_Account;

  factory _Account.fromJson(Map<String, dynamic> json) = _$_Account.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  SyncGroup? get selectedSyncGroup => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountCopyWith<_Account> get copyWith =>
      throw _privateConstructorUsedError;
}
