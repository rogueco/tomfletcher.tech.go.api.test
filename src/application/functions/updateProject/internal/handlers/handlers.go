package handlers

import (
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/rogueco.tomfletcher.tech.updateProject/internal/project"
	"net/http"
)

//
//type ErrorBody struct {
//	ErrorMessage *string `json:"error,omitempty"`
//}

func UpdateProject(req events.APIGatewayProxyRequest, dynamoClient *dynamodb.DynamoDB) (*events.APIGatewayProxyResponse, error) {
	result, err := project.UpdateProject(req, dynamoClient)
	if err != nil {
		fmt.Printf("Error is here:: %v\n", err)
		//return apiResponse(http.StatusBadRequest, ErrorBody{aws.String(err.Error())})
		return apiResponse(Response{StatusCode: http.StatusInternalServerError, Error: err.Error()})
	}

	return apiResponse(Response{StatusCode: http.StatusOK, Data: result})
}
