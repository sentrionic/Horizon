// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.21.4
// source: song_service.proto

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

type CreateSongRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// Types that are assignable to Data:
	//
	//	*CreateSongRequest_Details
	//	*CreateSongRequest_ChunkData
	Data isCreateSongRequest_Data `protobuf_oneof:"data"`
}

func (x *CreateSongRequest) Reset() {
	*x = CreateSongRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_song_service_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateSongRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateSongRequest) ProtoMessage() {}

func (x *CreateSongRequest) ProtoReflect() protoreflect.Message {
	mi := &file_song_service_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateSongRequest.ProtoReflect.Descriptor instead.
func (*CreateSongRequest) Descriptor() ([]byte, []int) {
	return file_song_service_proto_rawDescGZIP(), []int{0}
}

func (m *CreateSongRequest) GetData() isCreateSongRequest_Data {
	if m != nil {
		return m.Data
	}
	return nil
}

func (x *CreateSongRequest) GetDetails() *SongDetails {
	if x, ok := x.GetData().(*CreateSongRequest_Details); ok {
		return x.Details
	}
	return nil
}

func (x *CreateSongRequest) GetChunkData() []byte {
	if x, ok := x.GetData().(*CreateSongRequest_ChunkData); ok {
		return x.ChunkData
	}
	return nil
}

type isCreateSongRequest_Data interface {
	isCreateSongRequest_Data()
}

type CreateSongRequest_Details struct {
	Details *SongDetails `protobuf:"bytes,1,opt,name=details,proto3,oneof"`
}

type CreateSongRequest_ChunkData struct {
	ChunkData []byte `protobuf:"bytes,2,opt,name=chunk_data,json=chunkData,proto3,oneof"`
}

func (*CreateSongRequest_Details) isCreateSongRequest_Data() {}

func (*CreateSongRequest_ChunkData) isCreateSongRequest_Data() {}

type SongDetails struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Title    string `protobuf:"bytes,1,opt,name=title,proto3" json:"title,omitempty"`
	ArtistId string `protobuf:"bytes,2,opt,name=artist_id,json=artistId,proto3" json:"artist_id,omitempty"`
}

func (x *SongDetails) Reset() {
	*x = SongDetails{}
	if protoimpl.UnsafeEnabled {
		mi := &file_song_service_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SongDetails) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SongDetails) ProtoMessage() {}

func (x *SongDetails) ProtoReflect() protoreflect.Message {
	mi := &file_song_service_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SongDetails.ProtoReflect.Descriptor instead.
func (*SongDetails) Descriptor() ([]byte, []int) {
	return file_song_service_proto_rawDescGZIP(), []int{1}
}

func (x *SongDetails) GetTitle() string {
	if x != nil {
		return x.Title
	}
	return ""
}

func (x *SongDetails) GetArtistId() string {
	if x != nil {
		return x.ArtistId
	}
	return ""
}

type UpdateSongRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SongId string `protobuf:"bytes,1,opt,name=song_id,json=songId,proto3" json:"song_id,omitempty"`
	Title  string `protobuf:"bytes,2,opt,name=title,proto3" json:"title,omitempty"`
}

func (x *UpdateSongRequest) Reset() {
	*x = UpdateSongRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_song_service_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpdateSongRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpdateSongRequest) ProtoMessage() {}

func (x *UpdateSongRequest) ProtoReflect() protoreflect.Message {
	mi := &file_song_service_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpdateSongRequest.ProtoReflect.Descriptor instead.
func (*UpdateSongRequest) Descriptor() ([]byte, []int) {
	return file_song_service_proto_rawDescGZIP(), []int{2}
}

func (x *UpdateSongRequest) GetSongId() string {
	if x != nil {
		return x.SongId
	}
	return ""
}

func (x *UpdateSongRequest) GetTitle() string {
	if x != nil {
		return x.Title
	}
	return ""
}

type SongRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SongId string `protobuf:"bytes,1,opt,name=song_id,json=songId,proto3" json:"song_id,omitempty"`
}

func (x *SongRequest) Reset() {
	*x = SongRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_song_service_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SongRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SongRequest) ProtoMessage() {}

func (x *SongRequest) ProtoReflect() protoreflect.Message {
	mi := &file_song_service_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SongRequest.ProtoReflect.Descriptor instead.
func (*SongRequest) Descriptor() ([]byte, []int) {
	return file_song_service_proto_rawDescGZIP(), []int{3}
}

func (x *SongRequest) GetSongId() string {
	if x != nil {
		return x.SongId
	}
	return ""
}

type SongList struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Songs []*SongResponse `protobuf:"bytes,1,rep,name=songs,proto3" json:"songs,omitempty"`
}

func (x *SongList) Reset() {
	*x = SongList{}
	if protoimpl.UnsafeEnabled {
		mi := &file_song_service_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SongList) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SongList) ProtoMessage() {}

func (x *SongList) ProtoReflect() protoreflect.Message {
	mi := &file_song_service_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SongList.ProtoReflect.Descriptor instead.
func (*SongList) Descriptor() ([]byte, []int) {
	return file_song_service_proto_rawDescGZIP(), []int{4}
}

func (x *SongList) GetSongs() []*SongResponse {
	if x != nil {
		return x.Songs
	}
	return nil
}

type Filter struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Page     uint32  `protobuf:"varint,1,opt,name=page,proto3" json:"page,omitempty"`
	Limit    uint32  `protobuf:"varint,2,opt,name=limit,proto3" json:"limit,omitempty"`
	ArtistId *string `protobuf:"bytes,3,opt,name=artist_id,json=artistId,proto3,oneof" json:"artist_id,omitempty"`
	Query    *string `protobuf:"bytes,4,opt,name=query,proto3,oneof" json:"query,omitempty"`
	Order    *string `protobuf:"bytes,5,opt,name=order,proto3,oneof" json:"order,omitempty"`
}

func (x *Filter) Reset() {
	*x = Filter{}
	if protoimpl.UnsafeEnabled {
		mi := &file_song_service_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Filter) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Filter) ProtoMessage() {}

func (x *Filter) ProtoReflect() protoreflect.Message {
	mi := &file_song_service_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Filter.ProtoReflect.Descriptor instead.
func (*Filter) Descriptor() ([]byte, []int) {
	return file_song_service_proto_rawDescGZIP(), []int{5}
}

func (x *Filter) GetPage() uint32 {
	if x != nil {
		return x.Page
	}
	return 0
}

func (x *Filter) GetLimit() uint32 {
	if x != nil {
		return x.Limit
	}
	return 0
}

func (x *Filter) GetArtistId() string {
	if x != nil && x.ArtistId != nil {
		return *x.ArtistId
	}
	return ""
}

func (x *Filter) GetQuery() string {
	if x != nil && x.Query != nil {
		return *x.Query
	}
	return ""
}

func (x *Filter) GetOrder() string {
	if x != nil && x.Order != nil {
		return *x.Order
	}
	return ""
}

var File_song_service_proto protoreflect.FileDescriptor

var file_song_service_proto_rawDesc = []byte{
	0x0a, 0x12, 0x73, 0x6f, 0x6e, 0x67, 0x5f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x12, 0x02, 0x70, 0x62, 0x1a, 0x0a, 0x73, 0x6f, 0x6e, 0x67, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x16, 0x70, 0x6c, 0x61, 0x79, 0x6c, 0x69, 0x73, 0x74, 0x5f, 0x73,
	0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x69, 0x0a, 0x11,
	0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x12, 0x2b, 0x0a, 0x07, 0x64, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x73, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x0f, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x44, 0x65, 0x74, 0x61,
	0x69, 0x6c, 0x73, 0x48, 0x00, 0x52, 0x07, 0x64, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x73, 0x12, 0x1f,
	0x0a, 0x0a, 0x63, 0x68, 0x75, 0x6e, 0x6b, 0x5f, 0x64, 0x61, 0x74, 0x61, 0x18, 0x02, 0x20, 0x01,
	0x28, 0x0c, 0x48, 0x00, 0x52, 0x09, 0x63, 0x68, 0x75, 0x6e, 0x6b, 0x44, 0x61, 0x74, 0x61, 0x42,
	0x06, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x61, 0x22, 0x40, 0x0a, 0x0b, 0x53, 0x6f, 0x6e, 0x67, 0x44,
	0x65, 0x74, 0x61, 0x69, 0x6c, 0x73, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x12, 0x1b, 0x0a, 0x09,
	0x61, 0x72, 0x74, 0x69, 0x73, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x08, 0x61, 0x72, 0x74, 0x69, 0x73, 0x74, 0x49, 0x64, 0x22, 0x42, 0x0a, 0x11, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x17,
	0x0a, 0x07, 0x73, 0x6f, 0x6e, 0x67, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x06, 0x73, 0x6f, 0x6e, 0x67, 0x49, 0x64, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x74, 0x69, 0x74, 0x6c, 0x65, 0x22, 0x26, 0x0a,
	0x0b, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x17, 0x0a, 0x07,
	0x73, 0x6f, 0x6e, 0x67, 0x5f, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x73,
	0x6f, 0x6e, 0x67, 0x49, 0x64, 0x22, 0x32, 0x0a, 0x08, 0x53, 0x6f, 0x6e, 0x67, 0x4c, 0x69, 0x73,
	0x74, 0x12, 0x26, 0x0a, 0x05, 0x73, 0x6f, 0x6e, 0x67, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x10, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x52, 0x05, 0x73, 0x6f, 0x6e, 0x67, 0x73, 0x22, 0xac, 0x01, 0x0a, 0x06, 0x46, 0x69,
	0x6c, 0x74, 0x65, 0x72, 0x12, 0x12, 0x0a, 0x04, 0x70, 0x61, 0x67, 0x65, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x0d, 0x52, 0x04, 0x70, 0x61, 0x67, 0x65, 0x12, 0x14, 0x0a, 0x05, 0x6c, 0x69, 0x6d, 0x69,
	0x74, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x05, 0x6c, 0x69, 0x6d, 0x69, 0x74, 0x12, 0x20,
	0x0a, 0x09, 0x61, 0x72, 0x74, 0x69, 0x73, 0x74, 0x5f, 0x69, 0x64, 0x18, 0x03, 0x20, 0x01, 0x28,
	0x09, 0x48, 0x00, 0x52, 0x08, 0x61, 0x72, 0x74, 0x69, 0x73, 0x74, 0x49, 0x64, 0x88, 0x01, 0x01,
	0x12, 0x19, 0x0a, 0x05, 0x71, 0x75, 0x65, 0x72, 0x79, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x48,
	0x01, 0x52, 0x05, 0x71, 0x75, 0x65, 0x72, 0x79, 0x88, 0x01, 0x01, 0x12, 0x19, 0x0a, 0x05, 0x6f,
	0x72, 0x64, 0x65, 0x72, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x48, 0x02, 0x52, 0x05, 0x6f, 0x72,
	0x64, 0x65, 0x72, 0x88, 0x01, 0x01, 0x42, 0x0c, 0x0a, 0x0a, 0x5f, 0x61, 0x72, 0x74, 0x69, 0x73,
	0x74, 0x5f, 0x69, 0x64, 0x42, 0x08, 0x0a, 0x06, 0x5f, 0x71, 0x75, 0x65, 0x72, 0x79, 0x42, 0x08,
	0x0a, 0x06, 0x5f, 0x6f, 0x72, 0x64, 0x65, 0x72, 0x32, 0xf8, 0x02, 0x0a, 0x04, 0x53, 0x6f, 0x6e,
	0x67, 0x12, 0x26, 0x0a, 0x08, 0x47, 0x65, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x73, 0x12, 0x0a, 0x2e,
	0x70, 0x62, 0x2e, 0x46, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x1a, 0x0c, 0x2e, 0x70, 0x62, 0x2e, 0x53,
	0x6f, 0x6e, 0x67, 0x4c, 0x69, 0x73, 0x74, 0x22, 0x00, 0x12, 0x33, 0x0a, 0x0d, 0x47, 0x65, 0x74,
	0x4c, 0x69, 0x6b, 0x65, 0x64, 0x53, 0x6f, 0x6e, 0x67, 0x73, 0x12, 0x0a, 0x2e, 0x70, 0x62, 0x2e,
	0x46, 0x69, 0x6c, 0x74, 0x65, 0x72, 0x1a, 0x14, 0x2e, 0x70, 0x62, 0x2e, 0x50, 0x6c, 0x61, 0x79,
	0x6c, 0x69, 0x73, 0x74, 0x53, 0x6f, 0x6e, 0x67, 0x4c, 0x69, 0x73, 0x74, 0x22, 0x00, 0x12, 0x39,
	0x0a, 0x0a, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67, 0x12, 0x15, 0x2e, 0x70,
	0x62, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x10, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73,
	0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x28, 0x01, 0x12, 0x37, 0x0a, 0x0a, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67, 0x12, 0x15, 0x2e, 0x70, 0x62, 0x2e, 0x55, 0x70, 0x64,
	0x61, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x10,
	0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x22, 0x00, 0x12, 0x31, 0x0a, 0x0a, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x53, 0x6f, 0x6e, 0x67,
	0x12, 0x0f, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x10, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x31, 0x0a, 0x0a, 0x54, 0x6f, 0x67, 0x67, 0x6c, 0x65, 0x4c,
	0x69, 0x6b, 0x65, 0x12, 0x0f, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x1a, 0x10, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x39, 0x0a, 0x12, 0x49, 0x6e, 0x63, 0x72,
	0x65, 0x6d, 0x65, 0x6e, 0x74, 0x50, 0x6c, 0x61, 0x79, 0x43, 0x6f, 0x75, 0x6e, 0x74, 0x12, 0x0f,
	0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a,
	0x10, 0x2e, 0x70, 0x62, 0x2e, 0x53, 0x6f, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x22, 0x00, 0x42, 0x22, 0x5a, 0x20, 0x67, 0x69, 0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f,
	0x6d, 0x2f, 0x73, 0x65, 0x6e, 0x74, 0x72, 0x69, 0x6f, 0x6e, 0x69, 0x63, 0x2f, 0x68, 0x6f, 0x72,
	0x69, 0x7a, 0x6f, 0x6e, 0x2f, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_song_service_proto_rawDescOnce sync.Once
	file_song_service_proto_rawDescData = file_song_service_proto_rawDesc
)

func file_song_service_proto_rawDescGZIP() []byte {
	file_song_service_proto_rawDescOnce.Do(func() {
		file_song_service_proto_rawDescData = protoimpl.X.CompressGZIP(file_song_service_proto_rawDescData)
	})
	return file_song_service_proto_rawDescData
}

var file_song_service_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_song_service_proto_goTypes = []interface{}{
	(*CreateSongRequest)(nil), // 0: pb.CreateSongRequest
	(*SongDetails)(nil),       // 1: pb.SongDetails
	(*UpdateSongRequest)(nil), // 2: pb.UpdateSongRequest
	(*SongRequest)(nil),       // 3: pb.SongRequest
	(*SongList)(nil),          // 4: pb.SongList
	(*Filter)(nil),            // 5: pb.Filter
	(*SongResponse)(nil),      // 6: pb.SongResponse
	(*PlaylistSongList)(nil),  // 7: pb.PlaylistSongList
}
var file_song_service_proto_depIdxs = []int32{
	1, // 0: pb.CreateSongRequest.details:type_name -> pb.SongDetails
	6, // 1: pb.SongList.songs:type_name -> pb.SongResponse
	5, // 2: pb.Song.GetSongs:input_type -> pb.Filter
	5, // 3: pb.Song.GetLikedSongs:input_type -> pb.Filter
	0, // 4: pb.Song.CreateSong:input_type -> pb.CreateSongRequest
	2, // 5: pb.Song.UpdateSong:input_type -> pb.UpdateSongRequest
	3, // 6: pb.Song.DeleteSong:input_type -> pb.SongRequest
	3, // 7: pb.Song.ToggleLike:input_type -> pb.SongRequest
	3, // 8: pb.Song.IncrementPlayCount:input_type -> pb.SongRequest
	4, // 9: pb.Song.GetSongs:output_type -> pb.SongList
	7, // 10: pb.Song.GetLikedSongs:output_type -> pb.PlaylistSongList
	6, // 11: pb.Song.CreateSong:output_type -> pb.SongResponse
	6, // 12: pb.Song.UpdateSong:output_type -> pb.SongResponse
	6, // 13: pb.Song.DeleteSong:output_type -> pb.SongResponse
	6, // 14: pb.Song.ToggleLike:output_type -> pb.SongResponse
	6, // 15: pb.Song.IncrementPlayCount:output_type -> pb.SongResponse
	9, // [9:16] is the sub-list for method output_type
	2, // [2:9] is the sub-list for method input_type
	2, // [2:2] is the sub-list for extension type_name
	2, // [2:2] is the sub-list for extension extendee
	0, // [0:2] is the sub-list for field type_name
}

func init() { file_song_service_proto_init() }
func file_song_service_proto_init() {
	if File_song_service_proto != nil {
		return
	}
	file_song_proto_init()
	file_playlist_service_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_song_service_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateSongRequest); i {
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
		file_song_service_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SongDetails); i {
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
		file_song_service_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpdateSongRequest); i {
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
		file_song_service_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SongRequest); i {
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
		file_song_service_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SongList); i {
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
		file_song_service_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Filter); i {
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
	file_song_service_proto_msgTypes[0].OneofWrappers = []interface{}{
		(*CreateSongRequest_Details)(nil),
		(*CreateSongRequest_ChunkData)(nil),
	}
	file_song_service_proto_msgTypes[5].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_song_service_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_song_service_proto_goTypes,
		DependencyIndexes: file_song_service_proto_depIdxs,
		MessageInfos:      file_song_service_proto_msgTypes,
	}.Build()
	File_song_service_proto = out.File
	file_song_service_proto_rawDesc = nil
	file_song_service_proto_goTypes = nil
	file_song_service_proto_depIdxs = nil
}
