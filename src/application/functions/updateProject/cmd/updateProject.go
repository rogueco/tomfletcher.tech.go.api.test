package main

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.updateProject/internal/handlers"
	"net/http"
)

var dynamoClient *dynamodb.DynamoDB

type Project struct {
	Id               string `json:"id"`
	Title            string `json:"title"`
	KeyPoint         string `json:"keyPoint"`
	LiveLink         string `json:"liveLink"`
	GithubLink       string `json:"githubLink"`
	Blurb            string `json:"blurb"`
	Image            string `json:"image"`
	TechnologiesUsed string `json:"technologiesUsed"`
}

func updateProjectHandler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// print the request
	fmt.Printf("event.HttpMethod: %v\n", request.HTTPMethod)
	fmt.Printf("event.Body: %v\n", request.Body)

	var projectt Project
	err := json.Unmarshal([]byte(request.Body), &projectt)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return events.APIGatewayProxyResponse{
			Body:       string(err.Error()),
			StatusCode: http.StatusInternalServerError,
			Headers: map[string]string{
				"Content-Type":                 "application/json",
				"Access-Control-Allow-Origin":  "*",
				"Access-Control-Allow-Methods": "PUT",
				"Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
			},
		}, nil
	}

	fmt.Printf("project: %v\n", projectt)

	fmt.Printf("Before Project \n")
	project, _ := handlers.UpdateProject(request, dynamoClient)
	fmt.Printf("After Project \n")
	response, _ := json.Marshal(project)

	return events.APIGatewayProxyResponse{
		Body:       string(response),
		StatusCode: http.StatusOK,
		Headers: map[string]string{
			"Content-Type":                 "application/json",
			"Access-Control-Allow-Origin":  "*",
			"Access-Control-Allow-Methods": "PUT",
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

	lambda.Start(updateProjectHandler)
}
