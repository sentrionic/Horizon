package utils

import (
	"bytes"
	"errors"
	"fmt"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
	"log"
)

type FileRepository interface {
	UploadSong(songData bytes.Buffer, directory, filename string) (string, error)
	DeleteSong(key string) error
}

type fileStore struct {
	S3Session  *session.Session
	BucketName string
}

func NewFileStore(config Config) (FileRepository, error) {
	// Initialize S3 Session
	sess, err := session.NewSession(
		&aws.Config{
			Credentials: credentials.NewStaticCredentials(
				config.AccessKey,
				config.SecretKey,
				"",
			),
			Region: aws.String(config.Region),
		},
	)

	if err != nil {
		return nil, errors.New("cannot initialize s3 session")
	}

	return &fileStore{
		S3Session:  sess,
		BucketName: config.BucketName,
	}, nil
}

func (fs *fileStore) UploadSong(songData bytes.Buffer, directory, filename string) (string, error) {
	uploader := s3manager.NewUploader(fs.S3Session)

	key := fmt.Sprintf("songs/%s/%s.mp3", directory, filename)

	reader := bytes.NewReader(songData.Bytes())

	up, err := uploader.Upload(&s3manager.UploadInput{
		Body:        reader,
		Bucket:      aws.String(fs.BucketName),
		ContentType: aws.String("audio/mp3"),
		Key:         aws.String(key),
	})

	if err != nil {
		log.Printf("Failed to upload file: %v\n", err.Error())
		return "", errors.New("failed to upload the file")
	}

	return up.Location, nil
}

func (fs *fileStore) DeleteSong(key string) error {
	srv := s3.New(fs.S3Session)
	_, err := srv.DeleteObject(&s3.DeleteObjectInput{
		Bucket: aws.String(fs.BucketName),
		Key:    aws.String(key),
	})

	if err != nil {
		log.Printf("Failed to delete image: %v\n", err.Error())
		return errors.New("failed to delete the file")
	}

	return nil
}
