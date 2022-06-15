package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

func (server *AuthServer) Current(ctx context.Context, _ *pb.EmptyRequest) (*pb.AccountResponse, error) {
	userId, err := getUserIDFromContext(ctx)

	if err != nil {
		return nil, status.Error(codes.Unauthenticated, "Unauthenticated")
	}

	user, err := server.db.User.
		Query().
		Where(gen.IDEQ(*userId)).First(ctx)

	if err != nil {
		log.Println(err)
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "DB Error")
	}

	return convertAccount(user), nil
}
