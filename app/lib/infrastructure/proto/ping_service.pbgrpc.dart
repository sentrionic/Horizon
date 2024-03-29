///
//  Generated code. Do not modify.
//  source: ping_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'ping_service.pb.dart' as $4;
export 'ping_service.pb.dart';

class HealthCheckClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$4.PingRequest, $4.PingRequest>(
      '/pb.HealthCheck/Ping',
      ($4.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.PingRequest.fromBuffer(value));

  HealthCheckClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.PingRequest> ping($4.PingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }
}

abstract class HealthCheckServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.HealthCheck';

  HealthCheckServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.PingRequest, $4.PingRequest>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.PingRequest.fromBuffer(value),
        ($4.PingRequest value) => value.writeToBuffer()));
  }

  $async.Future<$4.PingRequest> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$4.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$4.PingRequest> ping(
      $grpc.ServiceCall call, $4.PingRequest request);
}
