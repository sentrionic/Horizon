// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.0
// 	protoc        v3.20.1
// source: playlist_service.proto

package pb

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type CreatePlaylistRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Name        string  `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Description *string `protobuf:"bytes,2,opt,name=description,proto3,oneof" json:"description,omitempty"`
}

func (x *CreatePlaylistRequest) Reset() {
	*x = CreatePlaylistRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreatePlaylistRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreatePlaylistRequest) ProtoMessage() {}

func (x *CreatePlaylistRequest) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreatePlaylistRequest.ProtoReflect.Descriptor instead.
func (*CreatePlaylistRequest) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{0}
}

func (x *CreatePlaylistRequest) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *CreatePlaylistRequest) GetDescription() string {
	if x != nil && x.Description != nil {
		return *x.Description
	}
	return ""
}

type UpdatePlaylistRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PlaylistId  string  `protobuf:"bytes,1,opt,name=playlist_id,json=playlistId,proto3" json:"playlist_id,omitempty"`
	Name        string  `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	Description *string `protobuf:"bytes,3,opt,name=description,proto3,oneof" json:"description,omitempty"`
}

func (x *UpdatePlaylistRequest) Reset() {
	*x = UpdatePlaylistRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdatePlaylistRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdatePlaylistRequest) ProtoMessage() {}

func (x *UpdatePlaylistRequest) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdatePlaylistRequest.ProtoReflect.Descriptor instead.
func (*UpdatePlaylistRequest) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{1}
}

func (x *UpdatePlaylistRequest) GetPlaylistId() string {
	if x != nil {
		return x.PlaylistId
	}
	return ""
}

func (x *UpdatePlaylistRequest) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *UpdatePlaylistRequest) GetDescription() string {
	if x != nil && x.Description != nil {
		return *x.Description
	}
	return ""
}

type PlaylistListResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Playlists []*PlaylistResponse `protobuf:"bytes,1,rep,name=playlists,proto3" json:"playlists,omitempty"`
}

func (x *PlaylistListResponse) Reset() {
	*x = PlaylistListResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PlaylistListResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PlaylistListResponse) ProtoMessage() {}

func (x *PlaylistListResponse) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PlaylistListResponse.ProtoReflect.Descriptor instead.
func (*PlaylistListResponse) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{2}
}

func (x *PlaylistListResponse) GetPlaylists() []*PlaylistResponse {
	if x != nil {
		return x.Playlists
	}
	return nil
}

type GetPlaylistRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *GetPlaylistRequest) Reset() {
	*x = GetPlaylistRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetPlaylistRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetPlaylistRequest) ProtoMessage() {}

func (x *GetPlaylistRequest) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetPlaylistRequest.ProtoReflect.Descriptor instead.
func (*GetPlaylistRequest) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{3}
}

type PlaylistRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *PlaylistRequest) Reset() {
	*x = PlaylistRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PlaylistRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PlaylistRequest) ProtoMessage() {}

func (x *PlaylistRequest) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PlaylistRequest.ProtoReflect.Descriptor instead.
func (*PlaylistRequest) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{4}
}

func (x *PlaylistRequest) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

type PlaylistSongRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	PlaylistId string `protobuf:"bytes,1,opt,name=playlist_id,json=playlistId,proto3" json:"playlist_id,omitempty"`
	SongId     string `protobuf:"bytes,2,opt,name=song_id,json=songId,proto3" json:"song_id,omitempty"`
}

func (x *PlaylistSongRequest) Reset() {
	*x = PlaylistSongRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PlaylistSongRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PlaylistSongRequest) ProtoMessage() {}

func (x *PlaylistSongRequest) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PlaylistSongRequest.ProtoReflect.Descriptor instead.
func (*PlaylistSongRequest) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{5}
}

func (x *PlaylistSongRequest) GetPlaylistId() string {
	if x != nil {
		return x.PlaylistId
	}
	return ""
}

func (x *PlaylistSongRequest) GetSongId() string {
	if x != nil {
		return x.SongId
	}
	return ""
}

type PlaylistSongList struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Songs []*PlaylistSongResponse `protobuf:"bytes,1,rep,name=songs,proto3" json:"songs,omitempty"`
}

func (x *PlaylistSongList) Reset() {
	*x = PlaylistSongList{}
	if protoimpl.UnsafeEnabled {
		mi := &file_playlist_service_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PlaylistSongList) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PlaylistSongList) ProtoMessage() {}

func (x *PlaylistSongList) ProtoReflect() protoreflect.Message {
	mi := &file_playlist_service_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PlaylistSongList.ProtoReflect.Descriptor instead.
func (*PlaylistSongList) Descriptor() ([]byte, []int) {
	return file_playlist_service_proto_rawDescGZIP(), []int{6}
}

func (x *PlaylistSongList) GetSongs() []*PlaylistSongResponse {
	if x != nil {
		return x.Songs
	}
	return nil
}

var File_playlist_service_proto protoreflect.FileDescriptor

var file_playlist_service_proto_rawDesc = []byte{
	0x0a, 0x16, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x5f, 0x73, 0x65, 0x72, 0x76, 0x69,
	0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x0a, 0x73, 0x6f,
	0x6e, 0x67, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0e, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69,
	0x73, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x62, 0x0a, 0x15, 0x43, 0x72, 0x65, 0x61,
	0x74, 0x65, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x25, 0x0a, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70,
	0x74, 0x69, 0x6f, 0x6e, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x48, 0x00, 0x52, 0x0b, 0x64, 0x65,
	0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x88, 0x01, 0x01, 0x42, 0x0e, 0x0a, 0x0c,
	0x5f, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0x83, 0x01, 0x0a,
	0x15, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1f, 0x0a, 0x0b, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69,
	0x73, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x70, 0x6c, 0x61,
	0x79, 0x6c, 0x69, 0x73, 0x74, 0x49, 0x64, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x25, 0x0a, 0x0b, 0x64,
	0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x48, 0x00, 0x52, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x88,
	0x01, 0x01, 0x42, 0x0e, 0x0a, 0x0c, 0x5f, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69,
	0x6f, 0x6e, 0x22, 0x4a, 0x0a, 0x14, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x4c, 0x69,
	0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x32, 0x0a, 0x09, 0x70, 0x6c,
	0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x14, 0x2e,
	0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x52, 0x09, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x73, 0x22, 0x14,
	0x0a, 0x12, 0x47, 0x65, 0x74, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x22, 0x21, 0x0a, 0x0f, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x22, 0x4f, 0x0a, 0x13, 0x50, 0x6c, 0x61, 0x79, 0x6c,
	0x69, 0x73, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1f,
	0x0a, 0x0b, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x0a, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x49, 0x64, 0x12,
	0x17, 0x0a, 0x07, 0x73, 0x6f, 0x6e, 0x67, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x73, 0x6f, 0x6e, 0x67, 0x49, 0x64, 0x22, 0x42, 0x0a, 0x10, 0x50, 0x6c, 0x61, 0x79,
	0x6c, 0x69, 0x73, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x4c, 0x69, 0x73, 0x74, 0x12, 0x2e, 0x0a, 0x05,
	0x73, 0x6f, 0x6e, 0x67, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x62,
	0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73,
	0x70, 0x6f, 0x6e, 0x73, 0x65, 0x52, 0x05, 0x73, 0x6f, 0x6e, 0x67, 0x73, 0x32, 0xcb, 0x03, 0x0a,
	0x08, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x12, 0x42, 0x0a, 0x0c, 0x47, 0x65, 0x74,
	0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x73, 0x12, 0x16, 0x2e, 0x70, 0x62, 0x2e, 0x47,
	0x65, 0x74, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x18, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x4c,
	0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x36, 0x0a,
	0x07, 0x41, 0x64, 0x64, 0x53, 0x6f, 0x6e, 0x67, 0x12, 0x17, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c,
	0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x10, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x39, 0x0a, 0x0a, 0x52, 0x65, 0x6d, 0x6f, 0x76, 0x65, 0x53,
	0x6f, 0x6e, 0x67, 0x12, 0x17, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73,
	0x74, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x10, 0x2e, 0x70,
	0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00,
	0x12, 0x43, 0x0a, 0x0e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69,
	0x73, 0x74, 0x12, 0x19, 0x2e, 0x70, 0x62, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x50, 0x6c,
	0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x14, 0x2e,
	0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x43, 0x0a, 0x0e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x50,
	0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x12, 0x19, 0x2e, 0x70, 0x62, 0x2e, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x1a, 0x14, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x3d, 0x0a, 0x0e, 0x44, 0x65,
	0x6c, 0x65, 0x74, 0x65, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x12, 0x13, 0x2e, 0x70,
	0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x14, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x3f, 0x0a, 0x10, 0x47, 0x65, 0x74,
	0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x73, 0x12, 0x13, 0x2e,
	0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x1a, 0x14, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74,
	0x53, 0x6f, 0x6e, 0x67, 0x4c, 0x69, 0x73, 0x74, 0x22, 0x00, 0x42, 0x22, 0x5a, 0x20, 0x67, 0x69,
	0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x73, 0x65, 0x6e, 0x74, 0x72, 0x69, 0x6f,
	0x6e, 0x69, 0x63, 0x2f, 0x68, 0x6f, 0x72, 0x69, 0x7a, 0x6f, 0x6e, 0x2f, 0x70, 0x62, 0x62, 0x06,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_playlist_service_proto_rawDescOnce sync.Once
	file_playlist_service_proto_rawDescData = file_playlist_service_proto_rawDesc
)

func file_playlist_service_proto_rawDescGZIP() []byte {
	file_playlist_service_proto_rawDescOnce.Do(func() {
		file_playlist_service_proto_rawDescData = protoimpl.X.CompressGZIP(file_playlist_service_proto_rawDescData)
	})
	return file_playlist_service_proto_rawDescData
}

var file_playlist_service_proto_msgTypes = make([]protoimpl.MessageInfo, 7)
var file_playlist_service_proto_goTypes = []interface{}{
	(*CreatePlaylistRequest)(nil), // 0: pb.CreatePlaylistRequest
	(*UpdatePlaylistRequest)(nil), // 1: pb.UpdatePlaylistRequest
	(*PlaylistListResponse)(nil),  // 2: pb.PlaylistListResponse
	(*GetPlaylistRequest)(nil),    // 3: pb.GetPlaylistRequest
	(*PlaylistRequest)(nil),       // 4: pb.PlaylistRequest
	(*PlaylistSongRequest)(nil),   // 5: pb.PlaylistSongRequest
	(*PlaylistSongList)(nil),      // 6: pb.PlaylistSongList
	(*PlaylistResponse)(nil),      // 7: pb.PlaylistResponse
	(*PlaylistSongResponse)(nil),  // 8: pb.PlaylistSongResponse
	(*SongResponse)(nil),          // 9: pb.SongResponse
}
var file_playlist_service_proto_depIdxs = []int32{
	7, // 0: pb.PlaylistListResponse.playlists:type_name -> pb.PlaylistResponse
	8, // 1: pb.PlaylistSongList.songs:type_name -> pb.PlaylistSongResponse
	3, // 2: pb.Playlist.GetPlaylists:input_type -> pb.GetPlaylistRequest
	5, // 3: pb.Playlist.AddSong:input_type -> pb.PlaylistSongRequest
	5, // 4: pb.Playlist.RemoveSong:input_type -> pb.PlaylistSongRequest
	0, // 5: pb.Playlist.CreatePlaylist:input_type -> pb.CreatePlaylistRequest
	1, // 6: pb.Playlist.UpdatePlaylist:input_type -> pb.UpdatePlaylistRequest
	4, // 7: pb.Playlist.DeletePlaylist:input_type -> pb.PlaylistRequest
	4, // 8: pb.Playlist.GetPlaylistSongs:input_type -> pb.PlaylistRequest
	2, // 9: pb.Playlist.GetPlaylists:output_type -> pb.PlaylistListResponse
	9, // 10: pb.Playlist.AddSong:output_type -> pb.SongResponse
	9, // 11: pb.Playlist.RemoveSong:output_type -> pb.SongResponse
	7, // 12: pb.Playlist.CreatePlaylist:output_type -> pb.PlaylistResponse
	7, // 13: pb.Playlist.UpdatePlaylist:output_type -> pb.PlaylistResponse
	7, // 14: pb.Playlist.DeletePlaylist:output_type -> pb.PlaylistResponse
	6, // 15: pb.Playlist.GetPlaylistSongs:output_type -> pb.PlaylistSongList
	9, // [9:16] is the sub-list for method output_type
	2, // [2:9] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_playlist_service_proto_init() }
func file_playlist_service_proto_init() {
	if File_playlist_service_proto != nil {
		return
	}
	file_song_proto_init()
	file_playlist_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_playlist_service_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreatePlaylistRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_playlist_service_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdatePlaylistRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_playlist_service_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PlaylistListResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_playlist_service_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetPlaylistRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_playlist_service_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PlaylistRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_playlist_service_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PlaylistSongRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_playlist_service_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PlaylistSongList); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	file_playlist_service_proto_msgTypes[0].OneofWrappers = []interface{}{}
	file_playlist_service_proto_msgTypes[1].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_playlist_service_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   7,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_playlist_service_proto_goTypes,
		DependencyIndexes: file_playlist_service_proto_depIdxs,
		MessageInfos:      file_playlist_service_proto_msgTypes,
	}.Build()
	File_playlist_service_proto = out.File
	file_playlist_service_proto_rawDesc = nil
	file_playlist_service_proto_goTypes = nil
	file_playlist_service_proto_depIdxs = nil
}
