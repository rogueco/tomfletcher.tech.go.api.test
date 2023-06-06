package handlers

import (
	"encoding/json"
	"fmt"
	"github.com/aws/aws-lambda-go/events"
)

type Response struct {
	Message    string      `json:"message"`
	StatusCode int         `json:"statusCode"`
	Data       interface{} `json:"data,omitempty"`
	Error      string      `json:"error,omitempty"`
}

func apiResponse(response Response) (*events.APIGatewayProxyResponse, error) {
	stringBody, err := json.MarshalIndent(response, "", " ")
	if err != nil {
		fmt.Printf("Error marshalling body: %v", err)
	}

	resp := events.APIGatewayProxyResponse{
		StatusCode:        response.StatusCode,
		Headers:           map[string]string{"Content-Type": "application/json"},
		MultiValueHeaders: nil,
		Body:              string(stringBody),
		IsBase64Encoded:   false,
	}

	return &resp, nil
}
