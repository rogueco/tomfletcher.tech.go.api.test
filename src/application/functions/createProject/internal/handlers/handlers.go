package handlers

import (
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.create/internal/project"
	"net/http"
)

//
//type ErrorBody struct {
//	ErrorMessage *string `json:"error,omitempty"`
//}

func CreateProject(req events.APIGatewayProxyRequest, dynamoClient *dynamodb.DynamoDB) (*events.APIGatewayProxyResponse, error) {

	result, err := project.CreateProject(req, dynamoClient)
	if err != nil {
		return apiResponse(Response{StatusCode: http.StatusInternalServerError, Error: err.Error()})
		//return apiResponse(http.StatusInternalServerError, ErrorBody{aws.String(err.Error())})
	}

	//return apiResponse(http.StatusCreated, result)
	return apiResponse(Response{StatusCode: http.StatusCreated, Data: result})
}
