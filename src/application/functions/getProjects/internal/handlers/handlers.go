package handlers

import (
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.getProjects/internal/project"
	"net/http"
)

//
//type ErrorBody struct {
//	ErrorMessage *string `json:"error,omitempty"`
//}

func GetProjects(dynamoClient *dynamodb.DynamoDB) (*events.APIGatewayProxyResponse, error) {
	result, err := project.FetchProjects(dynamoClient)
	if err != nil {
		return apiResponse(Response{StatusCode: http.StatusInternalServerError, Error: err.Error()})
		//return apiResponse(http.StatusInternalServerError, ErrorBody{aws.String(err.Error())})
	}

	//return apiResponse(http.StatusOK, fetchProject)
	return apiResponse(Response{StatusCode: http.StatusOK, Data: result})
}
