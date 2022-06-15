package server

import (
	"context"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

func (server *ArtistServer) SearchArtists(ctx context.Context, req *pb.SearchArtistRequest) (*pb.ArtistListResponse, error) {
	users, err := server.db.User.
		Query().
		Where(
			gen.And(
				gen.UsernameContainsFold(req.GetQuery()),
				gen.HasSongs(),
			),
		).
		Limit(int(req.Limit)).
		Offset(int(req.Page) * int(req.Limit)).
		All(ctx)

	if err != nil {
		log.Println(err)
		return nil, status.Error(codes.Internal, "DB Error")
	}

	res := make([]*pb.ArtistResponse, 0)

	for _, u := range users {
		res = append(res, convertArtist(u))
	}

	return &pb.ArtistListResponse{Artists: res}, nil
}
