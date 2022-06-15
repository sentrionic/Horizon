package client

import (
	"context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
)

// AuthInterceptor is a client interceptor for authentication
type AuthInterceptor struct {
	accessToken       string
	authorizationType string
	setUpMetadata     bool
}

// NewAuthInterceptor returns a new auth interceptor
func NewAuthInterceptor(token, authorizationType string, setUpMetadata bool) *AuthInterceptor {
	return &AuthInterceptor{
		accessToken:       token,
		authorizationType: authorizationType,
		setUpMetadata:     setUpMetadata,
	}
}

// Unary returns a client interceptor to authenticate unary RPC
func (interceptor *AuthInterceptor) Unary() grpc.UnaryClientInterceptor {
	return func(
		ctx context.Context,
		method string,
		req, reply any,
		cc *grpc.ClientConn,
		invoker grpc.UnaryInvoker,
		opts ...grpc.CallOption,
	) error {
		if interceptor.setUpMetadata {
			return invoker(interceptor.attachToken(ctx, interceptor.authorizationType), method, req, reply, cc, opts...)
		}
		return invoker(ctx, method, req, reply, cc, opts...)
	}
}

func (interceptor *AuthInterceptor) attachToken(ctx context.Context, authorizationType string) context.Context {
	return metadata.AppendToOutgoingContext(ctx, authorizationType, interceptor.accessToken)
}
