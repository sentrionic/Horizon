///
//  Generated code. Do not modify.
//  source: playlist_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createPlaylistRequestDescriptor instead')
const CreatePlaylistRequest$json = const {
  '1': 'CreatePlaylistRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'description',
      '17': true
    },
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `CreatePlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPlaylistRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQbGF5bGlzdFJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIlCgtkZXNjcmlwdGlvbhgCIAEoCUgAUgtkZXNjcmlwdGlvbogBAUIOCgxfZGVzY3JpcHRpb24=');
@$core.Deprecated('Use updatePlaylistRequestDescriptor instead')
const UpdatePlaylistRequest$json = const {
  '1': 'UpdatePlaylistRequest',
  '2': const [
    const {'1': 'playlist_id', '3': 1, '4': 1, '5': 9, '10': 'playlistId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'description',
      '17': true
    },
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `UpdatePlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlaylistRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQbGF5bGlzdFJlcXVlc3QSHwoLcGxheWxpc3RfaWQYASABKAlSCnBsYXlsaXN0SWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBAUIOCgxfZGVzY3JpcHRpb24=');
@$core.Deprecated('Use playlistListResponseDescriptor instead')
const PlaylistListResponse$json = const {
  '1': 'PlaylistListResponse',
  '2': const [
    const {
      '1': 'playlists',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pb.PlaylistResponse',
      '10': 'playlists'
    },
  ],
};

/// Descriptor for `PlaylistListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistListResponseDescriptor = $convert.base64Decode(
    'ChRQbGF5bGlzdExpc3RSZXNwb25zZRIyCglwbGF5bGlzdHMYASADKAsyFC5wYi5QbGF5bGlzdFJlc3BvbnNlUglwbGF5bGlzdHM=');
@$core.Deprecated('Use getPlaylistRequestDescriptor instead')
const GetPlaylistRequest$json = const {
  '1': 'GetPlaylistRequest',
};

/// Descriptor for `GetPlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPlaylistRequestDescriptor =
    $convert.base64Decode('ChJHZXRQbGF5bGlzdFJlcXVlc3Q=');
@$core.Deprecated('Use playlistRequestDescriptor instead')
const PlaylistRequest$json = const {
  '1': 'PlaylistRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `PlaylistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistRequestDescriptor =
    $convert.base64Decode('Cg9QbGF5bGlzdFJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use playlistSongRequestDescriptor instead')
const PlaylistSongRequest$json = const {
  '1': 'PlaylistSongRequest',
  '2': const [
    const {'1': 'playlist_id', '3': 1, '4': 1, '5': 9, '10': 'playlistId'},
    const {'1': 'song_id', '3': 2, '4': 1, '5': 9, '10': 'songId'},
  ],
};

/// Descriptor for `PlaylistSongRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistSongRequestDescriptor = $convert.base64Decode(
    'ChNQbGF5bGlzdFNvbmdSZXF1ZXN0Eh8KC3BsYXlsaXN0X2lkGAEgASgJUgpwbGF5bGlzdElkEhcKB3NvbmdfaWQYAiABKAlSBnNvbmdJZA==');
@$core.Deprecated('Use playlistSongListDescriptor instead')
const PlaylistSongList$json = const {
  '1': 'PlaylistSongList',
  '2': const [
    const {
      '1': 'songs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pb.PlaylistSongResponse',
      '10': 'songs'
    },
  ],
};

/// Descriptor for `PlaylistSongList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistSongListDescriptor = $convert.base64Decode(
    'ChBQbGF5bGlzdFNvbmdMaXN0Ei4KBXNvbmdzGAEgAygLMhgucGIuUGxheWxpc3RTb25nUmVzcG9uc2VSBXNvbmdz');
