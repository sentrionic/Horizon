///
//  Generated code. Do not modify.
//  source: artist_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'artist_service.pb.dart' as $0;
import 'song.pb.dart' as $1;
export 'artist_service.pb.dart';

class ArtistClient extends $grpc.Client {
  static final _$getArtist =
      $grpc.ClientMethod<$0.ArtistRequest, $1.ArtistResponse>(
          '/pb.Artist/GetArtist',
          ($0.ArtistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.ArtistResponse.fromBuffer(value));
  static final _$searchArtists =
      $grpc.ClientMethod<$0.SearchArtistRequest, $0.ArtistListResponse>(
          '/pb.Artist/SearchArtists',
          ($0.SearchArtistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ArtistListResponse.fromBuffer(value));

  ArtistClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ArtistResponse> getArtist($0.ArtistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getArtist, request, options: options);
  }

  $grpc.ResponseFuture<$0.ArtistListResponse> searchArtists(
      $0.SearchArtistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchArtists, request, options: options);
  }
}

abstract class ArtistServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Artist';

  ArtistServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ArtistRequest, $1.ArtistResponse>(
        'GetArtist',
        getArtist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ArtistRequest.fromBuffer(value),
        ($1.ArtistResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SearchArtistRequest, $0.ArtistListResponse>(
            'SearchArtists',
            searchArtists_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SearchArtistRequest.fromBuffer(value),
            ($0.ArtistListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ArtistResponse> getArtist_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ArtistRequest> request) async {
    return getArtist(call, await request);
  }

  $async.Future<$0.ArtistListResponse> searchArtists_Pre($grpc.ServiceCall call,
      $async.Future<$0.SearchArtistRequest> request) async {
    return searchArtists(call, await request);
  }

  $async.Future<$1.ArtistResponse> getArtist(
      $grpc.ServiceCall call, $0.ArtistRequest request);
  $async.Future<$0.ArtistListResponse> searchArtists(
      $grpc.ServiceCall call, $0.SearchArtistRequest request);
}
