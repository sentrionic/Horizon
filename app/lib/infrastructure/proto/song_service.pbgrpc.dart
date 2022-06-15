///
//  Generated code. Do not modify.
//  source: song_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'song_service.pb.dart' as $7;
import 'playlist_service.pb.dart' as $5;
import 'song.pb.dart' as $1;
export 'song_service.pb.dart';

class SongClient extends $grpc.Client {
  static final _$getSongs = $grpc.ClientMethod<$7.Filter, $7.SongList>(
      '/pb.Song/GetSongs',
      ($7.Filter value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.SongList.fromBuffer(value));
  static final _$getLikedSongs =
      $grpc.ClientMethod<$7.Filter, $5.PlaylistSongList>(
          '/pb.Song/GetLikedSongs',
          ($7.Filter value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.PlaylistSongList.fromBuffer(value));
  static final _$createSong =
      $grpc.ClientMethod<$7.CreateSongRequest, $1.SongResponse>(
          '/pb.Song/CreateSong',
          ($7.CreateSongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));
  static final _$updateSong =
      $grpc.ClientMethod<$7.UpdateSongRequest, $1.SongResponse>(
          '/pb.Song/UpdateSong',
          ($7.UpdateSongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));
  static final _$deleteSong =
      $grpc.ClientMethod<$7.SongRequest, $1.SongResponse>(
          '/pb.Song/DeleteSong',
          ($7.SongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));
  static final _$toggleLike =
      $grpc.ClientMethod<$7.SongRequest, $1.SongResponse>(
          '/pb.Song/ToggleLike',
          ($7.SongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));
  static final _$incrementPlayCount =
      $grpc.ClientMethod<$7.SongRequest, $1.SongResponse>(
          '/pb.Song/IncrementPlayCount',
          ($7.SongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));

  SongClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$7.SongList> getSongs($7.Filter request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSongs, request, options: options);
  }

  $grpc.ResponseFuture<$5.PlaylistSongList> getLikedSongs($7.Filter request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLikedSongs, request, options: options);
  }

  $grpc.ResponseFuture<$1.SongResponse> createSong(
      $async.Stream<$7.CreateSongRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createSong, request, options: options).single;
  }

  $grpc.ResponseFuture<$1.SongResponse> updateSong($7.UpdateSongRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSong, request, options: options);
  }

  $grpc.ResponseFuture<$1.SongResponse> deleteSong($7.SongRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteSong, request, options: options);
  }

  $grpc.ResponseFuture<$1.SongResponse> toggleLike($7.SongRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleLike, request, options: options);
  }

  $grpc.ResponseFuture<$1.SongResponse> incrementPlayCount(
      $7.SongRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$incrementPlayCount, request, options: options);
  }
}

abstract class SongServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Song';

  SongServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.Filter, $7.SongList>(
        'GetSongs',
        getSongs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.Filter.fromBuffer(value),
        ($7.SongList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.Filter, $5.PlaylistSongList>(
        'GetLikedSongs',
        getLikedSongs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.Filter.fromBuffer(value),
        ($5.PlaylistSongList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.CreateSongRequest, $1.SongResponse>(
        'CreateSong',
        createSong,
        true,
        false,
        ($core.List<$core.int> value) => $7.CreateSongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateSongRequest, $1.SongResponse>(
        'UpdateSong',
        updateSong_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateSongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.SongRequest, $1.SongResponse>(
        'DeleteSong',
        deleteSong_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.SongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.SongRequest, $1.SongResponse>(
        'ToggleLike',
        toggleLike_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.SongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.SongRequest, $1.SongResponse>(
        'IncrementPlayCount',
        incrementPlayCount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.SongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
  }

  $async.Future<$7.SongList> getSongs_Pre(
      $grpc.ServiceCall call, $async.Future<$7.Filter> request) async {
    return getSongs(call, await request);
  }

  $async.Future<$5.PlaylistSongList> getLikedSongs_Pre(
      $grpc.ServiceCall call, $async.Future<$7.Filter> request) async {
    return getLikedSongs(call, await request);
  }

  $async.Future<$1.SongResponse> updateSong_Pre($grpc.ServiceCall call,
      $async.Future<$7.UpdateSongRequest> request) async {
    return updateSong(call, await request);
  }

  $async.Future<$1.SongResponse> deleteSong_Pre(
      $grpc.ServiceCall call, $async.Future<$7.SongRequest> request) async {
    return deleteSong(call, await request);
  }

  $async.Future<$1.SongResponse> toggleLike_Pre(
      $grpc.ServiceCall call, $async.Future<$7.SongRequest> request) async {
    return toggleLike(call, await request);
  }

  $async.Future<$1.SongResponse> incrementPlayCount_Pre(
      $grpc.ServiceCall call, $async.Future<$7.SongRequest> request) async {
    return incrementPlayCount(call, await request);
  }

  $async.Future<$7.SongList> getSongs(
      $grpc.ServiceCall call, $7.Filter request);
  $async.Future<$5.PlaylistSongList> getLikedSongs(
      $grpc.ServiceCall call, $7.Filter request);
  $async.Future<$1.SongResponse> createSong(
      $grpc.ServiceCall call, $async.Stream<$7.CreateSongRequest> request);
  $async.Future<$1.SongResponse> updateSong(
      $grpc.ServiceCall call, $7.UpdateSongRequest request);
  $async.Future<$1.SongResponse> deleteSong(
      $grpc.ServiceCall call, $7.SongRequest request);
  $async.Future<$1.SongResponse> toggleLike(
      $grpc.ServiceCall call, $7.SongRequest request);
  $async.Future<$1.SongResponse> incrementPlayCount(
      $grpc.ServiceCall call, $7.SongRequest request);
}
