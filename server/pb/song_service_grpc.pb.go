// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.21.4
// source: song_service.proto

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

// SongClient is the client API for Song service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type SongClient interface {
	GetSongs(ctx context.Context, in *Filter, opts ...grpc.CallOption) (*SongList, error)
	GetLikedSongs(ctx context.Context, in *Filter, opts ...grpc.CallOption) (*PlaylistSongList, error)
	CreateSong(ctx context.Context, opts ...grpc.CallOption) (Song_CreateSongClient, error)
	UpdateSong(ctx context.Context, in *UpdateSongRequest, opts ...grpc.CallOption) (*SongResponse, error)
	DeleteSong(ctx context.Context, in *SongRequest, opts ...grpc.CallOption) (*SongResponse, error)
	ToggleLike(ctx context.Context, in *SongRequest, opts ...grpc.CallOption) (*SongResponse, error)
	IncrementPlayCount(ctx context.Context, in *SongRequest, opts ...grpc.CallOption) (*SongResponse, error)
}

type songClient struct {
	cc grpc.ClientConnInterface
}

func NewSongClient(cc grpc.ClientConnInterface) SongClient {
	return &songClient{cc}
}

func (c *songClient) GetSongs(ctx context.Context, in *Filter, opts ...grpc.CallOption) (*SongList, error) {
	out := new(SongList)
	err := c.cc.Invoke(ctx, "/pb.Song/GetSongs", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *songClient) GetLikedSongs(ctx context.Context, in *Filter, opts ...grpc.CallOption) (*PlaylistSongList, error) {
	out := new(PlaylistSongList)
	err := c.cc.Invoke(ctx, "/pb.Song/GetLikedSongs", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *songClient) CreateSong(ctx context.Context, opts ...grpc.CallOption) (Song_CreateSongClient, error) {
	stream, err := c.cc.NewStream(ctx, &Song_ServiceDesc.Streams[0], "/pb.Song/CreateSong", opts...)
	if err != nil {
		return nil, err
	}
	x := &songCreateSongClient{stream}
	return x, nil
}

type Song_CreateSongClient interface {
	Send(*CreateSongRequest) error
	CloseAndRecv() (*SongResponse, error)
	grpc.ClientStream
}

type songCreateSongClient struct {
	grpc.ClientStream
}

func (x *songCreateSongClient) Send(m *CreateSongRequest) error {
	return x.ClientStream.SendMsg(m)
}

func (x *songCreateSongClient) CloseAndRecv() (*SongResponse, error) {
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	m := new(SongResponse)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *songClient) UpdateSong(ctx context.Context, in *UpdateSongRequest, opts ...grpc.CallOption) (*SongResponse, error) {
	out := new(SongResponse)
	err := c.cc.Invoke(ctx, "/pb.Song/UpdateSong", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *songClient) DeleteSong(ctx context.Context, in *SongRequest, opts ...grpc.CallOption) (*SongResponse, error) {
	out := new(SongResponse)
	err := c.cc.Invoke(ctx, "/pb.Song/DeleteSong", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *songClient) ToggleLike(ctx context.Context, in *SongRequest, opts ...grpc.CallOption) (*SongResponse, error) {
	out := new(SongResponse)
	err := c.cc.Invoke(ctx, "/pb.Song/ToggleLike", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *songClient) IncrementPlayCount(ctx context.Context, in *SongRequest, opts ...grpc.CallOption) (*SongResponse, error) {
	out := new(SongResponse)
	err := c.cc.Invoke(ctx, "/pb.Song/IncrementPlayCount", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// SongServer is the server API for Song service.
// All implementations must embed UnimplementedSongServer
// for forward compatibility
type SongServer interface {
	GetSongs(context.Context, *Filter) (*SongList, error)
	GetLikedSongs(context.Context, *Filter) (*PlaylistSongList, error)
	CreateSong(Song_CreateSongServer) error
	UpdateSong(context.Context, *UpdateSongRequest) (*SongResponse, error)
	DeleteSong(context.Context, *SongRequest) (*SongResponse, error)
	ToggleLike(context.Context, *SongRequest) (*SongResponse, error)
	IncrementPlayCount(context.Context, *SongRequest) (*SongResponse, error)
	mustEmbedUnimplementedSongServer()
}

// UnimplementedSongServer must be embedded to have forward compatible implementations.
type UnimplementedSongServer struct {
}

func (UnimplementedSongServer) GetSongs(context.Context, *Filter) (*SongList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetSongs not implemented")
}
func (UnimplementedSongServer) GetLikedSongs(context.Context, *Filter) (*PlaylistSongList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetLikedSongs not implemented")
}
func (UnimplementedSongServer) CreateSong(Song_CreateSongServer) error {
	return status.Errorf(codes.Unimplemented, "method CreateSong not implemented")
}
func (UnimplementedSongServer) UpdateSong(context.Context, *UpdateSongRequest) (*SongResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateSong not implemented")
}
func (UnimplementedSongServer) DeleteSong(context.Context, *SongRequest) (*SongResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteSong not implemented")
}
func (UnimplementedSongServer) ToggleLike(context.Context, *SongRequest) (*SongResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ToggleLike not implemented")
}
func (UnimplementedSongServer) IncrementPlayCount(context.Context, *SongRequest) (*SongResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IncrementPlayCount not implemented")
}
func (UnimplementedSongServer) mustEmbedUnimplementedSongServer() {}

// UnsafeSongServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to SongServer will
// result in compilation errors.
type UnsafeSongServer interface {
	mustEmbedUnimplementedSongServer()
}

func RegisterSongServer(s grpc.ServiceRegistrar, srv SongServer) {
	s.RegisterService(&Song_ServiceDesc, srv)
}

func _Song_GetSongs_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Filter)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SongServer).GetSongs(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.Song/GetSongs",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SongServer).GetSongs(ctx, req.(*Filter))
	}
	return interceptor(ctx, in, info, handler)
}

func _Song_GetLikedSongs_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Filter)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SongServer).GetLikedSongs(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.Song/GetLikedSongs",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SongServer).GetLikedSongs(ctx, req.(*Filter))
	}
	return interceptor(ctx, in, info, handler)
}

func _Song_CreateSong_Handler(srv interface{}, stream grpc.ServerStream) error {
	return srv.(SongServer).CreateSong(&songCreateSongServer{stream})
}

type Song_CreateSongServer interface {
	SendAndClose(*SongResponse) error
	Recv() (*CreateSongRequest, error)
	grpc.ServerStream
}

type songCreateSongServer struct {
	grpc.ServerStream
}

func (x *songCreateSongServer) SendAndClose(m *SongResponse) error {
	return x.ServerStream.SendMsg(m)
}

func (x *songCreateSongServer) Recv() (*CreateSongRequest, error) {
	m := new(CreateSongRequest)
	if err := x.ServerStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func _Song_UpdateSong_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpdateSongRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SongServer).UpdateSong(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.Song/UpdateSong",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SongServer).UpdateSong(ctx, req.(*UpdateSongRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Song_DeleteSong_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SongRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SongServer).DeleteSong(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.Song/DeleteSong",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SongServer).DeleteSong(ctx, req.(*SongRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Song_ToggleLike_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SongRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SongServer).ToggleLike(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.Song/ToggleLike",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SongServer).ToggleLike(ctx, req.(*SongRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Song_IncrementPlayCount_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SongRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(SongServer).IncrementPlayCount(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/pb.Song/IncrementPlayCount",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(SongServer).IncrementPlayCount(ctx, req.(*SongRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// Song_ServiceDesc is the grpc.ServiceDesc for Song service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Song_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "pb.Song",
	HandlerType: (*SongServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GetSongs",
			Handler:    _Song_GetSongs_Handler,
		},
		{
			MethodName: "GetLikedSongs",
			Handler:    _Song_GetLikedSongs_Handler,
		},
		{
			MethodName: "UpdateSong",
			Handler:    _Song_UpdateSong_Handler,
		},
		{
			MethodName: "DeleteSong",
			Handler:    _Song_DeleteSong_Handler,
		},
		{
			MethodName: "ToggleLike",
			Handler:    _Song_ToggleLike_Handler,
		},
		{
			MethodName: "IncrementPlayCount",
			Handler:    _Song_IncrementPlayCount_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "CreateSong",
			Handler:       _Song_CreateSong_Handler,
			ClientStreams: true,
		},
	},
	Metadata: "song_service.proto",
}
