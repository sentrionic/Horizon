// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Song {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int? get plays => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String? get dateAdded => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  Artist get artist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String url,
      int? plays,
      int duration,
      String? dateAdded,
      bool isLiked,
      Artist artist});

  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$SongCopyWithImpl<$Res> implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  final Song _value;
  // ignore: unused_field
  final $Res Function(Song) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? plays = freezed,
    Object? duration = freezed,
    Object? dateAdded = freezed,
    Object? isLiked = freezed,
    Object? artist = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      plays: plays == freezed
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: dateAdded == freezed
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ));
  }

  @override
  $ArtistCopyWith<$Res> get artist {
    return $ArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value));
    });
  }
}

/// @nodoc
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String url,
      int? plays,
      int duration,
      String? dateAdded,
      bool isLiked,
      Artist artist});

  @override
  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, (v) => _then(v as _$_Song));

  @override
  _$_Song get _value => super._value as _$_Song;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? plays = freezed,
    Object? duration = freezed,
    Object? dateAdded = freezed,
    Object? isLiked = freezed,
    Object? artist = freezed,
  }) {
    return _then(_$_Song(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      plays: plays == freezed
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: dateAdded == freezed
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ));
  }
}

/// @nodoc

class _$_Song extends _Song {
  const _$_Song(
      {required this.id,
      required this.title,
      required this.url,
      this.plays,
      required this.duration,
      this.dateAdded,
      required this.isLiked,
      required this.artist})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String url;
  @override
  final int? plays;
  @override
  final int duration;
  @override
  final String? dateAdded;
  @override
  final bool isLiked;
  @override
  final Artist artist;

  @override
  String toString() {
    return 'Song(id: $id, title: $title, url: $url, plays: $plays, duration: $duration, dateAdded: $dateAdded, isLiked: $isLiked, artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.plays, plays) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.dateAdded, dateAdded) &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked) &&
            const DeepCollectionEquality().equals(other.artist, artist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(plays),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(dateAdded),
      const DeepCollectionEquality().hash(isLiked),
      const DeepCollectionEquality().hash(artist));

  @JsonKey(ignore: true)
  @override
  _$$_SongCopyWith<_$_Song> get copyWith =>
      __$$_SongCopyWithImpl<_$_Song>(this, _$identity);
}

abstract class _Song extends Song {
  const factory _Song(
      {required final String id,
      required final String title,
      required final String url,
      final int? plays,
      required final int duration,
      final String? dateAdded,
      required final bool isLiked,
      required final Artist artist}) = _$_Song;
  const _Song._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get url;
  @override
  int? get plays;
  @override
  int get duration;
  @override
  String? get dateAdded;
  @override
  bool get isLiked;
  @override
  Artist get artist;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
