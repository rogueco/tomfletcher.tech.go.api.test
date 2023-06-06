package project

import (
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

// DeleteProjectById Deletes a Project record with the specified ID from DynamoDB
// Returns any error encountered
func DeleteProjectById(id string, dynamoDbClient *dynamodb.DynamoDB) error {
	input := &dynamodb.DeleteItemInput{
		Key: map[string]*dynamodb.AttributeValue{
			"id": {
				S: aws.String(id),
			},
		},
		TableName: aws.String(tableName),
	}

	_, err := FetchProject(id, dynamoDbClient)
	if err != nil {
		return errors.New("does not exist")
	}

	_, err = dynamoDbClient.DeleteItem(input)
	if err != nil {
		return err
	}

	return nil
}
