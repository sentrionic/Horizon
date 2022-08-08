///
//  Generated code. Do not modify.
//  source: song_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'song.pb.dart' as $1;

enum CreateSongRequest_Data {
  details, 
  chunkData, 
  notSet
}

class CreateSongRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, CreateSongRequest_Data> _CreateSongRequest_DataByTag = {
    1 : CreateSongRequest_Data.details,
    2 : CreateSongRequest_Data.chunkData,
    0 : CreateSongRequest_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateSongRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<SongDetails>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'details', subBuilder: SongDetails.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chunkData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  CreateSongRequest._() : super();
  factory CreateSongRequest({
    SongDetails? details,
    $core.List<$core.int>? chunkData,
  }) {
    final _result = create();
    if (details != null) {
      _result.details = details;
    }
    if (chunkData != null) {
      _result.chunkData = chunkData;
    }
    return _result;
  }
  factory CreateSongRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSongRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSongRequest clone() => CreateSongRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSongRequest copyWith(void Function(CreateSongRequest) updates) => super.copyWith((message) => updates(message as CreateSongRequest)) as CreateSongRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateSongRequest create() => CreateSongRequest._();
  CreateSongRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSongRequest> createRepeated() => $pb.PbList<CreateSongRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSongRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSongRequest>(create);
  static CreateSongRequest? _defaultInstance;

  CreateSongRequest_Data whichData() => _CreateSongRequest_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  SongDetails get details => $_getN(0);
  @$pb.TagNumber(1)
  set details(SongDetails v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDetails() => $_has(0);
  @$pb.TagNumber(1)
  void clearDetails() => clearField(1);
  @$pb.TagNumber(1)
  SongDetails ensureDetails() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get chunkData => $_getN(1);
  @$pb.TagNumber(2)
  set chunkData($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunkData() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkData() => clearField(2);
}

class SongDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SongDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artistId')
    ..hasRequiredFields = false
  ;

  SongDetails._() : super();
  factory SongDetails({
    $core.String? title,
    $core.String? artistId,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (artistId != null) {
      _result.artistId = artistId;
    }
    return _result;
  }
  factory SongDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SongDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SongDetails clone() => SongDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SongDetails copyWith(void Function(SongDetails) updates) => super.copyWith((message) => updates(message as SongDetails)) as SongDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongDetails create() => SongDetails._();
  SongDetails createEmptyInstance() => create();
  static $pb.PbList<SongDetails> createRepeated() => $pb.PbList<SongDetails>();
  @$core.pragma('dart2js:noInline')
  static SongDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongDetails>(create);
  static SongDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get artistId => $_getSZ(1);
  @$pb.TagNumber(2)
  set artistId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasArtistId() => $_has(1);
  @$pb.TagNumber(2)
  void clearArtistId() => clearField(2);
}

class UpdateSongRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSongRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'songId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  UpdateSongRequest._() : super();
  factory UpdateSongRequest({
    $core.String? songId,
    $core.String? title,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory UpdateSongRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSongRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSongRequest clone() => UpdateSongRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSongRequest copyWith(void Function(UpdateSongRequest) updates) => super.copyWith((message) => updates(message as UpdateSongRequest)) as UpdateSongRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSongRequest create() => UpdateSongRequest._();
  UpdateSongRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSongRequest> createRepeated() => $pb.PbList<UpdateSongRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSongRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSongRequest>(create);
  static UpdateSongRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get songId => $_getSZ(0);
  @$pb.TagNumber(1)
  set songId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class SongRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SongRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'songId')
    ..hasRequiredFields = false
  ;

  SongRequest._() : super();
  factory SongRequest({
    $core.String? songId,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    return _result;
  }
  factory SongRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SongRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SongRequest clone() => SongRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SongRequest copyWith(void Function(SongRequest) updates) => super.copyWith((message) => updates(message as SongRequest)) as SongRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongRequest create() => SongRequest._();
  SongRequest createEmptyInstance() => create();
  static $pb.PbList<SongRequest> createRepeated() => $pb.PbList<SongRequest>();
  @$core.pragma('dart2js:noInline')
  static SongRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongRequest>(create);
  static SongRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get songId => $_getSZ(0);
  @$pb.TagNumber(1)
  set songId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => clearField(1);
}

class SongList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SongList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$1.SongResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'songs', $pb.PbFieldType.PM, subBuilder: $1.SongResponse.create)
    ..hasRequiredFields = false
  ;

  SongList._() : super();
  factory SongList({
    $core.Iterable<$1.SongResponse>? songs,
  }) {
    final _result = create();
    if (songs != null) {
      _result.songs.addAll(songs);
    }
    return _result;
  }
  factory SongList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SongList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SongList clone() => SongList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SongList copyWith(void Function(SongList) updates) => super.copyWith((message) => updates(message as SongList)) as SongList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SongList create() => SongList._();
  SongList createEmptyInstance() => create();
  static $pb.PbList<SongList> createRepeated() => $pb.PbList<SongList>();
  @$core.pragma('dart2js:noInline')
  static SongList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SongList>(create);
  static SongList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.SongResponse> get songs => $_getList(0);
}

class Filter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Filter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'artistId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order')
    ..hasRequiredFields = false
  ;

  Filter._() : super();
  factory Filter({
    $core.int? page,
    $core.int? limit,
    $core.String? artistId,
    $core.String? query,
    $core.String? order,
  }) {
    final _result = create();
    if (page != null) {
      _result.page = page;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (artistId != null) {
      _result.artistId = artistId;
    }
    if (query != null) {
      _result.query = query;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory Filter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Filter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Filter clone() => Filter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Filter copyWith(void Function(Filter) updates) => super.copyWith((message) => updates(message as Filter)) as Filter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Filter create() => Filter._();
  Filter createEmptyInstance() => create();
  static $pb.PbList<Filter> createRepeated() => $pb.PbList<Filter>();
  @$core.pragma('dart2js:noInline')
  static Filter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Filter>(create);
  static Filter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get artistId => $_getSZ(2);
  @$pb.TagNumber(3)
  set artistId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasArtistId() => $_has(2);
  @$pb.TagNumber(3)
  void clearArtistId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get query => $_getSZ(3);
  @$pb.TagNumber(4)
  set query($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuery() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuery() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get order => $_getSZ(4);
  @$pb.TagNumber(5)
  set order($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);
}

