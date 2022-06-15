// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Artist {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res>;
  $Res call({String id, String username, String image});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res> implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  final Artist _value;
  // ignore: unused_field
  final $Res Function(Artist) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$_ArtistCopyWith(_$_Artist value, $Res Function(_$_Artist) then) =
      __$$_ArtistCopyWithImpl<$Res>;
  @override
  $Res call({String id, String username, String image});
}

/// @nodoc
class __$$_ArtistCopyWithImpl<$Res> extends _$ArtistCopyWithImpl<$Res>
    implements _$$_ArtistCopyWith<$Res> {
  __$$_ArtistCopyWithImpl(_$_Artist _value, $Res Function(_$_Artist) _then)
      : super(_value, (v) => _then(v as _$_Artist));

  @override
  _$_Artist get _value => super._value as _$_Artist;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_Artist(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Artist extends _Artist {
  const _$_Artist(
      {required this.id, required this.username, required this.image})
      : super._();

  @override
  final String id;
  @override
  final String username;
  @override
  final String image;

  @override
  String toString() {
    return 'Artist(id: $id, username: $username, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artist &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      __$$_ArtistCopyWithImpl<_$_Artist>(this, _$identity);
}

abstract class _Artist extends Artist {
  const factory _Artist(
      {required final String id,
      required final String username,
      required final String image}) = _$_Artist;
  const _Artist._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistCopyWith<_$_Artist> get copyWith =>
      throw _privateConstructorUsedError;
}
