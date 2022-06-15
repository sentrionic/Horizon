package server

import (
	"context"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

func (server *ArtistServer) GetArtist(ctx context.Context, req *pb.ArtistRequest) (*pb.ArtistResponse, error) {
	id, err := uuid.Parse(req.GetId())

	if err != nil {
		return nil, status.Error(codes.InvalidArgument, "not a valid id")
	}

	user, err := server.db.User.
		Query().
		Where(gen.IDEQ(id)).First(ctx)

	if err != nil {
		log.Println(err)
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "DB Error")
	}

	return convertArtist(user), nil
}
