package main

import (
	"context"
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.create/internal/handlers"
	"net/http"
)

var dynamoClient *dynamodb.DynamoDB

func createProjectHandler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	// print the request
	fmt.Printf("event.HttpMethod: %v\n", request.HTTPMethod)

	response, _ := handlers.CreateProject(request, dynamoClient)

	return events.APIGatewayProxyResponse{
		Body:       response.Body,
		StatusCode: http.StatusOK,
		Headers: map[string]string{
			"Content-Type":                 "application/json",
			"Access-Control-Allow-Origin":  "*",
			"Access-Control-Allow-Methods": "POST",
			"Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
		},
	}, nil
}

func main() {

	// Create session
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	}))

	// Create DynamoDB client
	dynamoClient = dynamodb.New(sess)

	lambda.Start(createProjectHandler)
}
