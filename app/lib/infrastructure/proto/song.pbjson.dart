///
//  Generated code. Do not modify.
//  source: song.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use playlistSongResponseDescriptor instead')
const PlaylistSongResponse$json = const {
  '1': 'PlaylistSongResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'duration', '3': 4, '4': 1, '5': 13, '10': 'duration'},
    const {'1': 'date_added', '3': 5, '4': 1, '5': 9, '10': 'dateAdded'},
    const {'1': 'is_liked', '3': 6, '4': 1, '5': 8, '10': 'isLiked'},
    const {'1': 'artist', '3': 7, '4': 1, '5': 11, '6': '.pb.ArtistResponse', '10': 'artist'},
  ],
};

/// Descriptor for `PlaylistSongResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playlistSongResponseDescriptor = $convert.base64Decode('ChRQbGF5bGlzdFNvbmdSZXNwb25zZRIOCgJpZBgBIAEoCVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEhAKA3VybBgDIAEoCVIDdXJsEhoKCGR1cmF0aW9uGAQgASgNUghkdXJhdGlvbhIdCgpkYXRlX2FkZGVkGAUgASgJUglkYXRlQWRkZWQSGQoIaXNfbGlrZWQYBiABKAhSB2lzTGlrZWQSKgoGYXJ0aXN0GAcgASgLMhIucGIuQXJ0aXN0UmVzcG9uc2VSBmFydGlzdA==');
@$core.Deprecated('Use songResponseDescriptor instead')
const SongResponse$json = const {
  '1': 'SongResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'duration', '3': 4, '4': 1, '5': 13, '10': 'duration'},
    const {'1': 'plays', '3': 5, '4': 1, '5': 13, '10': 'plays'},
    const {'1': 'is_liked', '3': 6, '4': 1, '5': 8, '10': 'isLiked'},
    const {'1': 'artist', '3': 7, '4': 1, '5': 11, '6': '.pb.ArtistResponse', '10': 'artist'},
  ],
};

/// Descriptor for `SongResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List songResponseDescriptor = $convert.base64Decode('CgxTb25nUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIQCgN1cmwYAyABKAlSA3VybBIaCghkdXJhdGlvbhgEIAEoDVIIZHVyYXRpb24SFAoFcGxheXMYBSABKA1SBXBsYXlzEhkKCGlzX2xpa2VkGAYgASgIUgdpc0xpa2VkEioKBmFydGlzdBgHIAEoCzISLnBiLkFydGlzdFJlc3BvbnNlUgZhcnRpc3Q=');
@$core.Deprecated('Use artistResponseDescriptor instead')
const ArtistResponse$json = const {
  '1': 'ArtistResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'image', '3': 3, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `ArtistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistResponseDescriptor = $convert.base64Decode('Cg5BcnRpc3RSZXNwb25zZRIOCgJpZBgBIAEoCVICaWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhQKBWltYWdlGAMgASgJUgVpbWFnZQ==');
