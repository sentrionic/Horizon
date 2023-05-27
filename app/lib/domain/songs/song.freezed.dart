// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
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
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? plays = freezed,
    Object? duration = null,
    Object? dateAdded = freezed,
    Object? isLiked = null,
    Object? artist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      plays: freezed == plays
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res> get artist {
    return $ArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res, _$_Song>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? plays = freezed,
    Object? duration = null,
    Object? dateAdded = freezed,
    Object? isLiked = null,
    Object? artist = null,
  }) {
    return _then(_$_Song(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      plays: freezed == plays
          ? _value.plays
          : plays // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      artist: null == artist
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.plays, plays) || other.plays == plays) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, url, plays, duration, dateAdded, isLiked, artist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
