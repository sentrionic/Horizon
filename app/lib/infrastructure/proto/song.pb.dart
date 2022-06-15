///
//  Generated code. Do not modify.
//  source: song.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PlaylistSongResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PlaylistSongResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateAdded')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLiked')
    ..aOM<ArtistResponse>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artist',
        subBuilder: ArtistResponse.create)
    ..hasRequiredFields = false;

  PlaylistSongResponse._() : super();
  factory PlaylistSongResponse({
    $core.String? id,
    $core.String? title,
    $core.String? url,
    $core.int? duration,
    $core.String? dateAdded,
    $core.bool? isLiked,
    ArtistResponse? artist,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (url != null) {
      _result.url = url;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (dateAdded != null) {
      _result.dateAdded = dateAdded;
    }
    if (isLiked != null) {
      _result.isLiked = isLiked;
    }
    if (artist != null) {
      _result.artist = artist;
    }
    return _result;
  }
  factory PlaylistSongResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlaylistSongResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlaylistSongResponse clone() =>
      PlaylistSongResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlaylistSongResponse copyWith(void Function(PlaylistSongResponse) updates) =>
      super.copyWith((message) => updates(message as PlaylistSongResponse))
          as PlaylistSongResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistSongResponse create() => PlaylistSongResponse._();
  PlaylistSongResponse createEmptyInstance() => create();
  static $pb.PbList<PlaylistSongResponse> createRepeated() =>
      $pb.PbList<PlaylistSongResponse>();
  @$core.pragma('dart2js:noInline')
  static PlaylistSongResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlaylistSongResponse>(create);
  static PlaylistSongResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dateAdded => $_getSZ(4);
  @$pb.TagNumber(5)
  set dateAdded($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDateAdded() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateAdded() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isLiked => $_getBF(5);
  @$pb.TagNumber(6)
  set isLiked($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsLiked() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsLiked() => clearField(6);

  @$pb.TagNumber(7)
  ArtistResponse get artist => $_getN(6);
  @$pb.TagNumber(7)
  set artist(ArtistResponse v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasArtist() => $_has(6);
  @$pb.TagNumber(7)
  void clearArtist() => clearField(7);
  @$pb.TagNumber(7)
  ArtistResponse ensureArtist() => $_ensure(6);
}

class SongResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SongResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'plays',
        $pb.PbFieldType.OU3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLiked')
    ..aOM<ArtistResponse>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artist',
        subBuilder: ArtistResponse.create)
    ..hasRequiredFields = false;

  SongResponse._() : super();
  factory SongResponse({
    $core.String? id,
    $core.String? title,
    $core.String? url,
    $core.int? duration,
    $core.int? plays,
    $core.bool? isLiked,
    ArtistResponse? artist,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (url != null) {
      _result.url = url;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (plays != null) {
      _result.plays = plays;
    }
    if (isLiked != null) {
      _result.isLiked = isLiked;
    }
    if (artist != null) {
      _result.artist = artist;
    }
    return _result;
  }
  factory SongResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SongResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SongResponse clone() => SongResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SongResponse copyWith(void Function(SongResponse) updates) =>
      super.copyWith((message) => updates(message as SongResponse))
          as SongResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongResponse create() => SongResponse._();
  SongResponse createEmptyInstance() => create();
  static $pb.PbList<SongResponse> createRepeated() =>
      $pb.PbList<SongResponse>();
  @$core.pragma('dart2js:noInline')
  static SongResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongResponse>(create);
  static SongResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get plays => $_getIZ(4);
  @$pb.TagNumber(5)
  set plays($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPlays() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlays() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isLiked => $_getBF(5);
  @$pb.TagNumber(6)
  set isLiked($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsLiked() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsLiked() => clearField(6);

  @$pb.TagNumber(7)
  ArtistResponse get artist => $_getN(6);
  @$pb.TagNumber(7)
  set artist(ArtistResponse v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasArtist() => $_has(6);
  @$pb.TagNumber(7)
  void clearArtist() => clearField(7);
  @$pb.TagNumber(7)
  ArtistResponse ensureArtist() => $_ensure(6);
}

class ArtistResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ArtistResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  ArtistResponse._() : super();
  factory ArtistResponse({
    $core.String? id,
    $core.String? username,
    $core.String? image,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (username != null) {
      _result.username = username;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory ArtistResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ArtistResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ArtistResponse clone() => ArtistResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ArtistResponse copyWith(void Function(ArtistResponse) updates) =>
      super.copyWith((message) => updates(message as ArtistResponse))
          as ArtistResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArtistResponse create() => ArtistResponse._();
  ArtistResponse createEmptyInstance() => create();
  static $pb.PbList<ArtistResponse> createRepeated() =>
      $pb.PbList<ArtistResponse>();
  @$core.pragma('dart2js:noInline')
  static ArtistResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistResponse>(create);
  static ArtistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}
