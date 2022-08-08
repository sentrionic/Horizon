///
//  Generated code. Do not modify.
//  source: playlist_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'playlist.pb.dart' as $6;
import 'song.pb.dart' as $1;

class CreatePlaylistRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreatePlaylistRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  CreatePlaylistRequest._() : super();
  factory CreatePlaylistRequest({
    $core.String? name,
    $core.String? description,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory CreatePlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePlaylistRequest clone() => CreatePlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePlaylistRequest copyWith(void Function(CreatePlaylistRequest) updates) => super.copyWith((message) => updates(message as CreatePlaylistRequest)) as CreatePlaylistRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreatePlaylistRequest create() => CreatePlaylistRequest._();
  CreatePlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePlaylistRequest> createRepeated() => $pb.PbList<CreatePlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePlaylistRequest>(create);
  static CreatePlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class UpdatePlaylistRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlaylistRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlistId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  UpdatePlaylistRequest._() : super();
  factory UpdatePlaylistRequest({
    $core.String? playlistId,
    $core.String? name,
    $core.String? description,
  }) {
    final _result = create();
    if (playlistId != null) {
      _result.playlistId = playlistId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory UpdatePlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlaylistRequest clone() => UpdatePlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlaylistRequest copyWith(void Function(UpdatePlaylistRequest) updates) => super.copyWith((message) => updates(message as UpdatePlaylistRequest)) as UpdatePlaylistRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlaylistRequest create() => UpdatePlaylistRequest._();
  UpdatePlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlaylistRequest> createRepeated() => $pb.PbList<UpdatePlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlaylistRequest>(create);
  static UpdatePlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playlistId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playlistId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaylistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class PlaylistListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaylistListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$6.PlaylistResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlists', $pb.PbFieldType.PM, subBuilder: $6.PlaylistResponse.create)
    ..hasRequiredFields = false
  ;

  PlaylistListResponse._() : super();
  factory PlaylistListResponse({
    $core.Iterable<$6.PlaylistResponse>? playlists,
  }) {
    final _result = create();
    if (playlists != null) {
      _result.playlists.addAll(playlists);
    }
    return _result;
  }
  factory PlaylistListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistListResponse clone() => PlaylistListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistListResponse copyWith(void Function(PlaylistListResponse) updates) => super.copyWith((message) => updates(message as PlaylistListResponse)) as PlaylistListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistListResponse create() => PlaylistListResponse._();
  PlaylistListResponse createEmptyInstance() => create();
  static $pb.PbList<PlaylistListResponse> createRepeated() => $pb.PbList<PlaylistListResponse>();
  @$core.pragma('dart2js:noInline')
  static PlaylistListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistListResponse>(create);
  static PlaylistListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.PlaylistResponse> get playlists => $_getList(0);
}

class GetPlaylistRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPlaylistRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetPlaylistRequest._() : super();
  factory GetPlaylistRequest() => create();
  factory GetPlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPlaylistRequest clone() => GetPlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPlaylistRequest copyWith(void Function(GetPlaylistRequest) updates) => super.copyWith((message) => updates(message as GetPlaylistRequest)) as GetPlaylistRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPlaylistRequest create() => GetPlaylistRequest._();
  GetPlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<GetPlaylistRequest> createRepeated() => $pb.PbList<GetPlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPlaylistRequest>(create);
  static GetPlaylistRequest? _defaultInstance;
}

class PlaylistRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaylistRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  PlaylistRequest._() : super();
  factory PlaylistRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory PlaylistRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistRequest clone() => PlaylistRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistRequest copyWith(void Function(PlaylistRequest) updates) => super.copyWith((message) => updates(message as PlaylistRequest)) as PlaylistRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistRequest create() => PlaylistRequest._();
  PlaylistRequest createEmptyInstance() => create();
  static $pb.PbList<PlaylistRequest> createRepeated() => $pb.PbList<PlaylistRequest>();
  @$core.pragma('dart2js:noInline')
  static PlaylistRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistRequest>(create);
  static PlaylistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PlaylistSongRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaylistSongRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'playlistId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'songId')
    ..hasRequiredFields = false
  ;

  PlaylistSongRequest._() : super();
  factory PlaylistSongRequest({
    $core.String? playlistId,
    $core.String? songId,
  }) {
    final _result = create();
    if (playlistId != null) {
      _result.playlistId = playlistId;
    }
    if (songId != null) {
      _result.songId = songId;
    }
    return _result;
  }
  factory PlaylistSongRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistSongRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistSongRequest clone() => PlaylistSongRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistSongRequest copyWith(void Function(PlaylistSongRequest) updates) => super.copyWith((message) => updates(message as PlaylistSongRequest)) as PlaylistSongRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistSongRequest create() => PlaylistSongRequest._();
  PlaylistSongRequest createEmptyInstance() => create();
  static $pb.PbList<PlaylistSongRequest> createRepeated() => $pb.PbList<PlaylistSongRequest>();
  @$core.pragma('dart2js:noInline')
  static PlaylistSongRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistSongRequest>(create);
  static PlaylistSongRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playlistId => $_getSZ(0);
  @$pb.TagNumber(1)
  set playlistId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlaylistId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaylistId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get songId => $_getSZ(1);
  @$pb.TagNumber(2)
  set songId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSongId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongId() => clearField(2);
}

class PlaylistSongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaylistSongList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$1.PlaylistSongResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'songs', $pb.PbFieldType.PM, subBuilder: $1.PlaylistSongResponse.create)
    ..hasRequiredFields = false
  ;

  PlaylistSongList._() : super();
  factory PlaylistSongList({
    $core.Iterable<$1.PlaylistSongResponse>? songs,
  }) {
    final _result = create();
    if (songs != null) {
      _result.songs.addAll(songs);
    }
    return _result;
  }
  factory PlaylistSongList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaylistSongList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaylistSongList clone() => PlaylistSongList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaylistSongList copyWith(void Function(PlaylistSongList) updates) => super.copyWith((message) => updates(message as PlaylistSongList)) as PlaylistSongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaylistSongList create() => PlaylistSongList._();
  PlaylistSongList createEmptyInstance() => create();
  static $pb.PbList<PlaylistSongList> createRepeated() => $pb.PbList<PlaylistSongList>();
  @$core.pragma('dart2js:noInline')
  static PlaylistSongList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaylistSongList>(create);
  static PlaylistSongList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.PlaylistSongResponse> get songs => $_getList(0);
}

