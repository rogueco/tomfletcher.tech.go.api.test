package main

import (
	"context"
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.delete/internal/handlers"
	"net/http"
)

var dynamoClient *dynamodb.DynamoDB

func getProjectHandler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	// print the request
	fmt.Printf("event.HttpMethod: %v\n", request.HTTPMethod)
	fmt.Printf("Before Fetch: PathParameters: %v\n", request.PathParameters["projectId"])

	response, err := handlers.DeleteProject(request, dynamoClient)
	if err != nil {
		return events.APIGatewayProxyResponse{
			Body:       string(err.Error()),
			StatusCode: http.StatusInternalServerError,
			Headers: map[string]string{
				"Content-Type":                 "application/json",
				"Access-Control-Allow-Origin":  "*",
				"Access-Control-Allow-Methods": "DELETE",
				"Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
			},
		}, nil
	}

	return events.APIGatewayProxyResponse{
		Body:       response.Body,
		StatusCode: http.StatusOK,
		Headers: map[string]string{
			"Content-Type":                 "application/json",
			"Access-Control-Allow-Origin":  "*",
			"Access-Control-Allow-Methods": "GET",
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

	lambda.Start(getProjectHandler)
}
