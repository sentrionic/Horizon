///
//  Generated code. Do not modify.
//  source: playlist_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'playlist_service.pb.dart' as $5;
import 'song.pb.dart' as $1;
import 'playlist.pb.dart' as $6;
export 'playlist_service.pb.dart';

class PlaylistClient extends $grpc.Client {
  static final _$getPlaylists =
      $grpc.ClientMethod<$5.GetPlaylistRequest, $5.PlaylistListResponse>(
          '/pb.Playlist/GetPlaylists',
          ($5.GetPlaylistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.PlaylistListResponse.fromBuffer(value));
  static final _$addSong =
      $grpc.ClientMethod<$5.PlaylistSongRequest, $1.SongResponse>(
          '/pb.Playlist/AddSong',
          ($5.PlaylistSongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));
  static final _$removeSong =
      $grpc.ClientMethod<$5.PlaylistSongRequest, $1.SongResponse>(
          '/pb.Playlist/RemoveSong',
          ($5.PlaylistSongRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.SongResponse.fromBuffer(value));
  static final _$createPlaylist =
      $grpc.ClientMethod<$5.CreatePlaylistRequest, $6.PlaylistResponse>(
          '/pb.Playlist/CreatePlaylist',
          ($5.CreatePlaylistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $6.PlaylistResponse.fromBuffer(value));
  static final _$updatePlaylist =
      $grpc.ClientMethod<$5.UpdatePlaylistRequest, $6.PlaylistResponse>(
          '/pb.Playlist/UpdatePlaylist',
          ($5.UpdatePlaylistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $6.PlaylistResponse.fromBuffer(value));
  static final _$deletePlaylist =
      $grpc.ClientMethod<$5.PlaylistRequest, $6.PlaylistResponse>(
          '/pb.Playlist/DeletePlaylist',
          ($5.PlaylistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $6.PlaylistResponse.fromBuffer(value));
  static final _$getPlaylistSongs =
      $grpc.ClientMethod<$5.PlaylistRequest, $5.PlaylistSongList>(
          '/pb.Playlist/GetPlaylistSongs',
          ($5.PlaylistRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.PlaylistSongList.fromBuffer(value));

  PlaylistClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.PlaylistListResponse> getPlaylists(
      $5.GetPlaylistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlaylists, request, options: options);
  }

  $grpc.ResponseFuture<$1.SongResponse> addSong($5.PlaylistSongRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addSong, request, options: options);
  }

  $grpc.ResponseFuture<$1.SongResponse> removeSong(
      $5.PlaylistSongRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeSong, request, options: options);
  }

  $grpc.ResponseFuture<$6.PlaylistResponse> createPlaylist(
      $5.CreatePlaylistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$6.PlaylistResponse> updatePlaylist(
      $5.UpdatePlaylistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$6.PlaylistResponse> deletePlaylist(
      $5.PlaylistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePlaylist, request, options: options);
  }

  $grpc.ResponseFuture<$5.PlaylistSongList> getPlaylistSongs(
      $5.PlaylistRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlaylistSongs, request, options: options);
  }
}

abstract class PlaylistServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Playlist';

  PlaylistServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$5.GetPlaylistRequest, $5.PlaylistListResponse>(
            'GetPlaylists',
            getPlaylists_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.GetPlaylistRequest.fromBuffer(value),
            ($5.PlaylistListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.PlaylistSongRequest, $1.SongResponse>(
        'AddSong',
        addSong_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.PlaylistSongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.PlaylistSongRequest, $1.SongResponse>(
        'RemoveSong',
        removeSong_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.PlaylistSongRequest.fromBuffer(value),
        ($1.SongResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.CreatePlaylistRequest, $6.PlaylistResponse>(
            'CreatePlaylist',
            createPlaylist_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.CreatePlaylistRequest.fromBuffer(value),
            ($6.PlaylistResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$5.UpdatePlaylistRequest, $6.PlaylistResponse>(
            'UpdatePlaylist',
            updatePlaylist_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $5.UpdatePlaylistRequest.fromBuffer(value),
            ($6.PlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.PlaylistRequest, $6.PlaylistResponse>(
        'DeletePlaylist',
        deletePlaylist_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.PlaylistRequest.fromBuffer(value),
        ($6.PlaylistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.PlaylistRequest, $5.PlaylistSongList>(
        'GetPlaylistSongs',
        getPlaylistSongs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.PlaylistRequest.fromBuffer(value),
        ($5.PlaylistSongList value) => value.writeToBuffer()));
  }

  $async.Future<$5.PlaylistListResponse> getPlaylists_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.GetPlaylistRequest> request) async {
    return getPlaylists(call, await request);
  }

  $async.Future<$1.SongResponse> addSong_Pre($grpc.ServiceCall call,
      $async.Future<$5.PlaylistSongRequest> request) async {
    return addSong(call, await request);
  }

  $async.Future<$1.SongResponse> removeSong_Pre($grpc.ServiceCall call,
      $async.Future<$5.PlaylistSongRequest> request) async {
    return removeSong(call, await request);
  }

  $async.Future<$6.PlaylistResponse> createPlaylist_Pre($grpc.ServiceCall call,
      $async.Future<$5.CreatePlaylistRequest> request) async {
    return createPlaylist(call, await request);
  }

  $async.Future<$6.PlaylistResponse> updatePlaylist_Pre($grpc.ServiceCall call,
      $async.Future<$5.UpdatePlaylistRequest> request) async {
    return updatePlaylist(call, await request);
  }

  $async.Future<$6.PlaylistResponse> deletePlaylist_Pre(
      $grpc.ServiceCall call, $async.Future<$5.PlaylistRequest> request) async {
    return deletePlaylist(call, await request);
  }

  $async.Future<$5.PlaylistSongList> getPlaylistSongs_Pre(
      $grpc.ServiceCall call, $async.Future<$5.PlaylistRequest> request) async {
    return getPlaylistSongs(call, await request);
  }

  $async.Future<$5.PlaylistListResponse> getPlaylists(
      $grpc.ServiceCall call, $5.GetPlaylistRequest request);
  $async.Future<$1.SongResponse> addSong(
      $grpc.ServiceCall call, $5.PlaylistSongRequest request);
  $async.Future<$1.SongResponse> removeSong(
      $grpc.ServiceCall call, $5.PlaylistSongRequest request);
  $async.Future<$6.PlaylistResponse> createPlaylist(
      $grpc.ServiceCall call, $5.CreatePlaylistRequest request);
  $async.Future<$6.PlaylistResponse> updatePlaylist(
      $grpc.ServiceCall call, $5.UpdatePlaylistRequest request);
  $async.Future<$6.PlaylistResponse> deletePlaylist(
      $grpc.ServiceCall call, $5.PlaylistRequest request);
  $async.Future<$5.PlaylistSongList> getPlaylistSongs(
      $grpc.ServiceCall call, $5.PlaylistRequest request);
}
