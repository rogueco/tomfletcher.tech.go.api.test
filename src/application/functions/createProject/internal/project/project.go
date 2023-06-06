package project

import (
	"encoding/json"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"
	"github.com/google/uuid"
	"github.com/pkg/errors"
)

// Project Define a struct to represent a Project record in DynamoDB
type Project struct {
	Id               string `json:"id" dynamodbav:"id"`
	Title            string `json:"title"`
	KeyPoint         string `json:"keyPoint"`
	LiveLink         string `json:"liveLink"`
	GithubLink       string `json:"githubLink"`
	Blurb            string `json:"blurb"`
	Image            string `json:"image"`
	TechnologiesUsed string `json:"technologiesUsed"`
}

// Define the name of the DynamoDB table that stores Project records
const tableName = "project"

// CreateProject Creates a new Project record in DynamoDB with the data provided in the APIGatewayProxyRequest
// Returns a pointer to the newly created Project object and any error encountered
func CreateProject(req events.APIGatewayProxyRequest, dynamoDbClient *dynamodb.DynamoDB) (*Project, error) {
	var project Project
	err := json.Unmarshal([]byte(req.Body), &project)
	if err != nil {
		return nil, errors.New(err.Error())
	}
	project.Id = uuid.NewString()

	attributeValues, err := dynamodbattribute.MarshalMap(project)
	if err != nil {
		return nil, errors.New(err.Error())
	}

	input := &dynamodb.PutItemInput{
		Item:      attributeValues,
		TableName: aws.String(tableName),
	}

	_, err = dynamoDbClient.PutItem(input)
	if err != nil {
		return nil, errors.New(err.Error())
	}

	return &project, nil
}
