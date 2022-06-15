package server

import (
	"context"
	"github.com/sentrionic/horizon/ent"
	gen "github.com/sentrionic/horizon/ent/user"
	"github.com/sentrionic/horizon/pb"
	"github.com/sentrionic/horizon/validator"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"log"
)

func validateUpdateRequest(req *pb.UpdateRequest) (violations []*errdetails.BadRequest_FieldViolation) {
	if err := validator.ValidateUsername(req.GetUsername()); err != nil {
		violations = append(violations, fieldViolation("username", err))
	}

	if err := validator.ValidateEmail(req.GetEmail()); err != nil {
		violations = append(violations, fieldViolation("email", err))
	}

	return violations
}

func (server *AuthServer) Update(ctx context.Context, req *pb.UpdateRequest) (*pb.AccountResponse, error) {
	violations := validateUpdateRequest(req)
	if violations != nil {
		return nil, invalidArgumentError(violations)
	}

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

	user.Email = req.GetEmail()
	user.Username = req.GetUsername()

	err = server.db.User.
		UpdateOneID(*userId).
		SetUsername(req.GetUsername()).
		SetEmail(req.GetEmail()).
		Exec(ctx)

	if err != nil {
		if ent.IsConstraintError(err) {
			return nil, status.Error(codes.PermissionDenied, "an account with that name already exists")
		}
		return nil, status.Error(codes.Internal, "error updating the account")
	}

	return convertAccount(user), nil
}
