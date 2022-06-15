///
//  Generated code. Do not modify.
//  source: auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth_service.pb.dart' as $2;
import 'account.pb.dart' as $3;
export 'auth_service.pb.dart';

class AuthClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$2.RegisterRequest, $2.AuthResponse>(
          '/pb.Auth/Register',
          ($2.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AuthResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$2.LoginRequest, $2.AuthResponse>(
      '/pb.Auth/Login',
      ($2.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.AuthResponse.fromBuffer(value));
  static final _$current =
      $grpc.ClientMethod<$2.EmptyRequest, $3.AccountResponse>(
          '/pb.Auth/Current',
          ($2.EmptyRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.AccountResponse.fromBuffer(value));
  static final _$update =
      $grpc.ClientMethod<$2.UpdateRequest, $3.AccountResponse>(
          '/pb.Auth/Update',
          ($2.UpdateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.AccountResponse.fromBuffer(value));

  AuthClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.AuthResponse> register($2.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$2.AuthResponse> login($2.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$3.AccountResponse> current($2.EmptyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$current, request, options: options);
  }

  $grpc.ResponseFuture<$3.AccountResponse> update($2.UpdateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }
}

abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Auth';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.RegisterRequest, $2.AuthResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RegisterRequest.fromBuffer(value),
        ($2.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.LoginRequest, $2.AuthResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.LoginRequest.fromBuffer(value),
        ($2.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyRequest, $3.AccountResponse>(
        'Current',
        current_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyRequest.fromBuffer(value),
        ($3.AccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateRequest, $3.AccountResponse>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateRequest.fromBuffer(value),
        ($3.AccountResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.AuthResponse> register_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$2.AuthResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$2.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$3.AccountResponse> current_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyRequest> request) async {
    return current(call, await request);
  }

  $async.Future<$3.AccountResponse> update_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdateRequest> request) async {
    return update(call, await request);
  }

  $async.Future<$2.AuthResponse> register(
      $grpc.ServiceCall call, $2.RegisterRequest request);
  $async.Future<$2.AuthResponse> login(
      $grpc.ServiceCall call, $2.LoginRequest request);
  $async.Future<$3.AccountResponse> current(
      $grpc.ServiceCall call, $2.EmptyRequest request);
  $async.Future<$3.AccountResponse> update(
      $grpc.ServiceCall call, $2.UpdateRequest request);
}
