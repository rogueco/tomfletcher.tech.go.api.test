package project

import (
	"encoding/json"
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"
	"github.com/pkg/errors"
	log "github.com/sirupsen/logrus"
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

// FetchProject Fetches a Project record with the specified ID from DynamoDB
// Returns a pointer to a Project object and any error encountered
func FetchProject(id string, dynamoDbClient *dynamodb.DynamoDB) (*Project, error) {
	log.WithFields(log.Fields{
		"function": "FetchProject",
		"id":       id,
	}).Info("Fetching project")

	input := &dynamodb.GetItemInput{
		Key: map[string]*dynamodb.AttributeValue{
			"id": {
				S: aws.String(id),
			},
		},
		TableName: aws.String(tableName),
	}

	result, err := dynamoDbClient.GetItem(input)
	if err != nil {
		return nil, errors.Wrap(err, "failed to fetch project")
	}

	if result.Item == nil {
		return nil, nil
	}

	project := new(Project)
	err = dynamodbattribute.UnmarshalMap(result.Item, project)
	if err != nil {
		return nil, errors.Wrap(err, "failed to unmarshal project")
	}

	return project, nil
}

// UpdateProject Updates an existing Project record in DynamoDB with the data provided in the APIGatewayProxyRequest
// Returns a pointer to the updated Project object and any error encountered
func UpdateProject(req events.APIGatewayProxyRequest, dynamoDbClient *dynamodb.DynamoDB) (*Project, error) {
	fmt.Printf("req.Bodyyyyy: %v\n", req.Body)
	var project Project
	err := json.Unmarshal([]byte(req.Body), &project)
	if err != nil {
		return nil, errors.New(err.Error())
	}

	id := req.PathParameters["projectId"]
	fmt.Printf("id: %v\n", id)
	_, err = FetchProject(id, dynamoDbClient)
	if err != nil {
		return nil, errors.New("Went wong!")
	}

	input := &dynamodb.UpdateItemInput{
		Key: map[string]*dynamodb.AttributeValue{
			"id": {
				S: aws.String(id),
			},
		},
		TableName:        aws.String(tableName),
		UpdateExpression: aws.String("SET title = :title, keyPoint = :keyPoint, liveLink = :liveLink, githubLink = :githubLink, blurb = :blurb, image = :image, technologiesUsed = :technologiesUsed"),
		ExpressionAttributeValues: map[string]*dynamodb.AttributeValue{
			":title": {
				S: aws.String(project.Title),
			},
			":keyPoint": {
				S: aws.String(project.KeyPoint),
			},
			":liveLink": {
				S: aws.String(project.LiveLink),
			},
			":githubLink": {
				S: aws.String(project.GithubLink),
			},
			":blurb": {
				S: aws.String(project.Blurb),
			},
			":image": {
				S: aws.String(project.Image),
			},
			":technologiesUsed": {
				S: aws.String(project.TechnologiesUsed),
			},
		},
	}

	_, err = dynamoDbClient.UpdateItem(input)
	if err != nil {
		return nil, errors.New(err.Error())
	}

	return &project, nil
}
