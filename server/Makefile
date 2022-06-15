postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:alpine

createdb:
	docker exec -it postgres createdb --username=root --owner=root horizon

dropdb:
	docker exec -it postgres dropdb horizon

recreate:
	make dropdb && make createdb

proto_go:
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative --go-grpc_out=pb --go-grpc_opt=paths=source_relative proto/*.proto

proto_dart:
	protoc -I proto proto/*.proto --dart_out=grpc:..\app\lib\infrastructure\proto

clean_go:
	del pb\*.go /s /q

clean_dart:
	del ..\app\lib\infrastructure\proto\*.dart /s /q

ent:
	go generate .\ent\...

gen:
	make clean_go && make clean_dart && make proto_go && make proto_dart

lint:
	golangci-lint run

test:
	go test -v -cover ./...
	
build:
	go build github.com/sentrionic/horizon/cmd/server

.PHONY: proto clean gen ent dart test lint clean_dart clean_go