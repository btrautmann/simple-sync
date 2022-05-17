// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sync_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SyncGroup _$SyncGroupFromJson(Map<String, dynamic> json) {
  return _SyncGroup.fromJson(json);
}

/// @nodoc
mixin _$SyncGroup {
  String get name => throw _privateConstructorUsedError;
  String get passphrase => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncGroupCopyWith<SyncGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncGroupCopyWith<$Res> {
  factory $SyncGroupCopyWith(SyncGroup value, $Res Function(SyncGroup) then) =
      _$SyncGroupCopyWithImpl<$Res>;
  $Res call({String name, String passphrase, String id});
}

/// @nodoc
class _$SyncGroupCopyWithImpl<$Res> implements $SyncGroupCopyWith<$Res> {
  _$SyncGroupCopyWithImpl(this._value, this._then);

  final SyncGroup _value;
  // ignore: unused_field
  final $Res Function(SyncGroup) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? passphrase = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      passphrase: passphrase == freezed
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SyncGroupCopyWith<$Res> implements $SyncGroupCopyWith<$Res> {
  factory _$$_SyncGroupCopyWith(
          _$_SyncGroup value, $Res Function(_$_SyncGroup) then) =
      __$$_SyncGroupCopyWithImpl<$Res>;
  @override
  $Res call({String name, String passphrase, String id});
}

/// @nodoc
class __$$_SyncGroupCopyWithImpl<$Res> extends _$SyncGroupCopyWithImpl<$Res>
    implements _$$_SyncGroupCopyWith<$Res> {
  __$$_SyncGroupCopyWithImpl(
      _$_SyncGroup _value, $Res Function(_$_SyncGroup) _then)
      : super(_value, (v) => _then(v as _$_SyncGroup));

  @override
  _$_SyncGroup get _value => super._value as _$_SyncGroup;

  @override
  $Res call({
    Object? name = freezed,
    Object? passphrase = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_SyncGroup(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      passphrase: passphrase == freezed
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SyncGroup implements _SyncGroup {
  _$_SyncGroup(
      {required this.name, required this.passphrase, required this.id});

  factory _$_SyncGroup.fromJson(Map<String, dynamic> json) =>
      _$$_SyncGroupFromJson(json);

  @override
  final String name;
  @override
  final String passphrase;
  @override
  final String id;

  @override
  String toString() {
    return 'SyncGroup(name: $name, passphrase: $passphrase, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncGroup &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.passphrase, passphrase) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(passphrase),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_SyncGroupCopyWith<_$_SyncGroup> get copyWith =>
      __$$_SyncGroupCopyWithImpl<_$_SyncGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SyncGroupToJson(this);
  }
}

abstract class _SyncGroup implements SyncGroup {
  factory _SyncGroup(
      {required final String name,
      required final String passphrase,
      required final String id}) = _$_SyncGroup;

  factory _SyncGroup.fromJson(Map<String, dynamic> json) =
      _$_SyncGroup.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get passphrase => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SyncGroupCopyWith<_$_SyncGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
