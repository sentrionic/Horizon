///
//  Generated code. Do not modify.
//  source: artist_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use artistRequestDescriptor instead')
const ArtistRequest$json = const {
  '1': 'ArtistRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ArtistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistRequestDescriptor =
    $convert.base64Decode('Cg1BcnRpc3RSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use searchArtistRequestDescriptor instead')
const SearchArtistRequest$json = const {
  '1': 'SearchArtistRequest',
  '2': const [
    const {'1': 'page', '3': 1, '4': 1, '5': 13, '10': 'page'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
    const {'1': 'query', '3': 3, '4': 1, '5': 9, '10': 'query'},
    const {
      '1': 'order',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'order',
      '17': true
    },
  ],
  '8': const [
    const {'1': '_order'},
  ],
};

/// Descriptor for `SearchArtistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchArtistRequestDescriptor = $convert.base64Decode(
    'ChNTZWFyY2hBcnRpc3RSZXF1ZXN0EhIKBHBhZ2UYASABKA1SBHBhZ2USFAoFbGltaXQYAiABKA1SBWxpbWl0EhQKBXF1ZXJ5GAMgASgJUgVxdWVyeRIZCgVvcmRlchgEIAEoCUgAUgVvcmRlcogBAUIICgZfb3JkZXI=');
@$core.Deprecated('Use artistListResponseDescriptor instead')
const ArtistListResponse$json = const {
  '1': 'ArtistListResponse',
  '2': const [
    const {
      '1': 'artists',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pb.ArtistResponse',
      '10': 'artists'
    },
  ],
};

/// Descriptor for `ArtistListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List artistListResponseDescriptor = $convert.base64Decode(
    'ChJBcnRpc3RMaXN0UmVzcG9uc2USLAoHYXJ0aXN0cxgBIAMoCzISLnBiLkFydGlzdFJlc3BvbnNlUgdhcnRpc3Rz');
