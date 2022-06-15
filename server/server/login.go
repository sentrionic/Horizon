package server

import (
	"context"
	"github.com/alexedwards/argon2id"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

func validateLogin(req *pb.LoginRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	if err := validator.ValidatePassword(req.GetPassword()); err != nil {
		violations = append(violations, fieldViolation("password", err))
	}

	return violations
}

func (server *AuthServer) Login(ctx context.Context, req *pb.LoginRequest) (*pb.AuthResponse, error) {
	violations := validateLogin(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

	user, err := server.db.User.
		Query().
		Where(gen.EmailEQ(req.GetEmail())).First(ctx)

	if err != nil {
		log.Println(err)
		if ent.IsNotFound(err) {
			return nil, status.Error(codes.NotFound, "user not found")
		}
		return nil, status.Error(codes.Internal, "DB Error")
	}

	match, err := argon2id.ComparePasswordAndHash(req.GetPassword(), user.Password)

	if err != nil {
		log.Println(err)
		return nil, status.Error(codes.NotFound, "Invalid Credentials")
	}

	if !match {
		return nil, status.Error(codes.NotFound, "Invalid Credentials")
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
