package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

func validateRegisterRequest(req *pb.RegisterRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidateUsername(req.GetUsername()); err != nil {
		violations = append(violations, fieldViolation("username", err))
	}

	if err := validator.ValidatePassword(req.GetPassword()); err != nil {
		violations = append(violations, fieldViolation("password", err))
	}

	if err := validator.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	return violations
}

func (server *AuthServer) Register(ctx context.Context, req *pb.RegisterRequest) (*pb.AuthResponse, error) {
	violations := validateRegisterRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	user, err := server.db.User.
		Create().
		SetUsername(req.GetUsername()).
		SetEmail(req.GetEmail()).
		SetPassword(req.GetPassword()).
		Save(ctx)

	if err != nil {
		log.Println(err)
		if ent.IsConstraintError(err) {
			return nil, status.Error(codes.PermissionDenied, "an account with that name already exists")
		}
		return nil, status.Error(codes.Internal, "DB Error")
	}

	accessToken, err := server.tokenMaker.CreateToken(user.ID, user.Role, server.config.AccessTokenDuration)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "cannot generate access token")
	}

	res := &pb.AuthResponse{
		AccessToken: accessToken,
		Account:     convertAccount(user),
	}

	return res, nil
}
