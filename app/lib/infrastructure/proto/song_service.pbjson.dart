///
//  Generated code. Do not modify.
//  source: song_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createSongRequestDescriptor instead')
const CreateSongRequest$json = const {
  '1': 'CreateSongRequest',
  '2': const [
    const {
      '1': 'details',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pb.SongDetails',
      '9': 0,
      '10': 'details'
    },
    const {
      '1': 'chunk_data',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'chunkData'
    },
  ],
  '8': const [
    const {'1': 'data'},
  ],
};

/// Descriptor for `CreateSongRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSongRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVTb25nUmVxdWVzdBIrCgdkZXRhaWxzGAEgASgLMg8ucGIuU29uZ0RldGFpbHNIAFIHZGV0YWlscxIfCgpjaHVua19kYXRhGAIgASgMSABSCWNodW5rRGF0YUIGCgRkYXRh');
@$core.Deprecated('Use songDetailsDescriptor instead')
const SongDetails$json = const {
  '1': 'SongDetails',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'artist_id', '3': 2, '4': 1, '5': 9, '10': 'artistId'},
  ],
};

/// Descriptor for `SongDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List songDetailsDescriptor = $convert.base64Decode(
    'CgtTb25nRGV0YWlscxIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGwoJYXJ0aXN0X2lkGAIgASgJUghhcnRpc3RJZA==');
@$core.Deprecated('Use updateSongRequestDescriptor instead')
const UpdateSongRequest$json = const {
  '1': 'UpdateSongRequest',
  '2': const [
    const {'1': 'song_id', '3': 1, '4': 1, '5': 9, '10': 'songId'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `UpdateSongRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSongRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVTb25nUmVxdWVzdBIXCgdzb25nX2lkGAEgASgJUgZzb25nSWQSFAoFdGl0bGUYAiABKAlSBXRpdGxl');
@$core.Deprecated('Use songRequestDescriptor instead')
const SongRequest$json = const {
  '1': 'SongRequest',
  '2': const [
    const {'1': 'song_id', '3': 1, '4': 1, '5': 9, '10': 'songId'},
  ],
};

/// Descriptor for `SongRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List songRequestDescriptor = $convert
    .base64Decode('CgtTb25nUmVxdWVzdBIXCgdzb25nX2lkGAEgASgJUgZzb25nSWQ=');
@$core.Deprecated('Use songListDescriptor instead')
const SongList$json = const {
  '1': 'SongList',
  '2': const [
    const {
      '1': 'songs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pb.SongResponse',
      '10': 'songs'
    },
  ],
};

/// Descriptor for `SongList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List songListDescriptor = $convert.base64Decode(
    'CghTb25nTGlzdBImCgVzb25ncxgBIAMoCzIQLnBiLlNvbmdSZXNwb25zZVIFc29uZ3M=');
@$core.Deprecated('Use filterDescriptor instead')
const Filter$json = const {
  '1': 'Filter',
  '2': const [
    const {'1': 'page', '3': 1, '4': 1, '5': 13, '10': 'page'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
    const {
      '1': 'artist_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'artistId',
      '17': true
    },
    const {
      '1': 'query',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'query',
      '17': true
    },
    const {
      '1': 'order',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'order',
      '17': true
    },
  ],
  '8': const [
    const {'1': '_artist_id'},
    const {'1': '_query'},
    const {'1': '_order'},
  ],
};

/// Descriptor for `Filter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterDescriptor = $convert.base64Decode(
    'CgZGaWx0ZXISEgoEcGFnZRgBIAEoDVIEcGFnZRIUCgVsaW1pdBgCIAEoDVIFbGltaXQSIAoJYXJ0aXN0X2lkGAMgASgJSABSCGFydGlzdElkiAEBEhkKBXF1ZXJ5GAQgASgJSAFSBXF1ZXJ5iAEBEhkKBW9yZGVyGAUgASgJSAJSBW9yZGVyiAEBQgwKCl9hcnRpc3RfaWRCCAoGX3F1ZXJ5QggKBl9vcmRlcg==');
