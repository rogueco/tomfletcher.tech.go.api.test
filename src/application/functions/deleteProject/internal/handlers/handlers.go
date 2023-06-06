package handlers

import (
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.delete/internal/project"
	"net/http"
)

//
//type ErrorBody struct {
//	ErrorMessage *string `json:"error,omitempty"`
//}

func DeleteProject(req events.APIGatewayProxyRequest, dynamoClient *dynamodb.DynamoDB) (*events.APIGatewayProxyResponse, error) {
	id := req.PathParameters["projectId"]
	err := project.DeleteProjectById(id, dynamoClient)
	if err != nil {
		//return apiResponse(http.StatusInternalServerError, ErrorBody{aws.String(err.Error())})
		return apiResponse(Response{StatusCode: http.StatusInternalServerError, Error: err.Error()})
	}

	return apiResponse(Response{StatusCode: http.StatusOK, Message: "Successfully, deleted"})
	//return apiResponse(http.StatusOK, nil)
}
