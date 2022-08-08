// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.21.4
// source: ping_service.proto

package pb

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// HealthCheckClient is the client API for HealthCheck service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type HealthCheckClient interface {
	Ping(ctx context.Context, in *PingRequest, opts ...grpc.CallOption) (*PingRequest, error)
}

type healthCheckClient struct {
	cc grpc.ClientConnInterface
}

func NewHealthCheckClient(cc grpc.ClientConnInterface) HealthCheckClient {
	return &healthCheckClient{cc}
}

func (c *healthCheckClient) Ping(ctx context.Context, in *PingRequest, opts ...grpc.CallOption) (*PingRequest, error) {
	out := new(PingRequest)
	err := c.cc.Invoke(ctx, "/pb.HealthCheck/Ping", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// HealthCheckServer is the server API for HealthCheck service.
// All implementations must embed UnimplementedHealthCheckServer
// for forward compatibility
type HealthCheckServer interface {
	Ping(context.Context, *PingRequest) (*PingRequest, error)
	mustEmbedUnimplementedHealthCheckServer()
}

// UnimplementedHealthCheckServer must be embedded to have forward compatible implementations.
type UnimplementedHealthCheckServer struct {
}

func (UnimplementedHealthCheckServer) Ping(context.Context, *PingRequest) (*PingRequest, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Ping not implemented")
}
func (UnimplementedHealthCheckServer) mustEmbedUnimplementedHealthCheckServer() {}

// UnsafeHealthCheckServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to HealthCheckServer will
// result in compilation errors.
type UnsafeHealthCheckServer interface {
	mustEmbedUnimplementedHealthCheckServer()
}

func RegisterHealthCheckServer(s grpc.ServiceRegistrar, srv HealthCheckServer) {
	s.RegisterService(&HealthCheck_ServiceDesc, srv)
}

func _HealthCheck_Ping_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(PingRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(HealthCheckServer).Ping(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.HealthCheck/Ping",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(HealthCheckServer).Ping(ctx, req.(*PingRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// HealthCheck_ServiceDesc is the grpc.ServiceDesc for HealthCheck service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var HealthCheck_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "pb.HealthCheck",
	HandlerType: (*HealthCheckServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Ping",
			Handler:    _HealthCheck_Ping_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "ping_service.proto",
}
