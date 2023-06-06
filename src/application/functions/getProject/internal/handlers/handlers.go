package handlers

import (
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.getProject/internal/project"
	"net/http"
)

//
//type ErrorBody struct {
//	ErrorMessage *string `json:"error,omitempty"`
//}

func GetProject(req events.APIGatewayProxyRequest, dynamoClient *dynamodb.DynamoDB) (*events.APIGatewayProxyResponse, error) {
	id := req.PathParameters["projectId"]
	result, err := project.FetchProject(id, dynamoClient)
	if err != nil {
		return apiResponse(Response{StatusCode: http.StatusInternalServerError, Error: err.Error()})
		//return apiResponse(http.StatusInternalServerError, ErrorBody{aws.String(err.Error())})
	}

	//return apiResponse(http.StatusOK, fetchProject)
	return apiResponse(Response{StatusCode: http.StatusOK, Data: result})
}
