///
//  Generated code. Do not modify.
//  source: artist_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'song.pb.dart' as $1;

class ArtistRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ArtistRequest',
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
    ..hasRequiredFields = false;

  ArtistRequest._() : super();
  factory ArtistRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ArtistRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ArtistRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ArtistRequest clone() => ArtistRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ArtistRequest copyWith(void Function(ArtistRequest) updates) =>
      super.copyWith((message) => updates(message as ArtistRequest))
          as ArtistRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArtistRequest create() => ArtistRequest._();
  ArtistRequest createEmptyInstance() => create();
  static $pb.PbList<ArtistRequest> createRepeated() =>
      $pb.PbList<ArtistRequest>();
  @$core.pragma('dart2js:noInline')
  static ArtistRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistRequest>(create);
  static ArtistRequest? _defaultInstance;

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
}

class SearchArtistRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SearchArtistRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limit',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'query')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'order')
    ..hasRequiredFields = false;

  SearchArtistRequest._() : super();
  factory SearchArtistRequest({
    $core.int? page,
    $core.int? limit,
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
    if (query != null) {
      _result.query = query;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory SearchArtistRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SearchArtistRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SearchArtistRequest clone() => SearchArtistRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SearchArtistRequest copyWith(void Function(SearchArtistRequest) updates) =>
      super.copyWith((message) => updates(message as SearchArtistRequest))
          as SearchArtistRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchArtistRequest create() => SearchArtistRequest._();
  SearchArtistRequest createEmptyInstance() => create();
  static $pb.PbList<SearchArtistRequest> createRepeated() =>
      $pb.PbList<SearchArtistRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchArtistRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchArtistRequest>(create);
  static SearchArtistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get query => $_getSZ(2);
  @$pb.TagNumber(3)
  set query($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuery() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get order => $_getSZ(3);
  @$pb.TagNumber(4)
  set order($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrder() => clearField(4);
}

class ArtistListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ArtistListResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<$1.ArtistResponse>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artists',
        $pb.PbFieldType.PM,
        subBuilder: $1.ArtistResponse.create)
    ..hasRequiredFields = false;

  ArtistListResponse._() : super();
  factory ArtistListResponse({
    $core.Iterable<$1.ArtistResponse>? artists,
  }) {
    final _result = create();
    if (artists != null) {
      _result.artists.addAll(artists);
    }
    return _result;
  }
  factory ArtistListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ArtistListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ArtistListResponse clone() => ArtistListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ArtistListResponse copyWith(void Function(ArtistListResponse) updates) =>
      super.copyWith((message) => updates(message as ArtistListResponse))
          as ArtistListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArtistListResponse create() => ArtistListResponse._();
  ArtistListResponse createEmptyInstance() => create();
  static $pb.PbList<ArtistListResponse> createRepeated() =>
      $pb.PbList<ArtistListResponse>();
  @$core.pragma('dart2js:noInline')
  static ArtistListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtistListResponse>(create);
  static ArtistListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.ArtistResponse> get artists => $_getList(0);
}
