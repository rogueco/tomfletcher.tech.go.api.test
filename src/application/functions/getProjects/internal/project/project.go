package project

import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"
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

// FetchProjects Fetches all Project records from DynamoDB
// Returns a slice of pointers to Project objects and any error encountered
func FetchProjects(dynamoDbClient *dynamodb.DynamoDB) ([]*Project, error) {
	var projects []*Project

	input := &dynamodb.ScanInput{
		TableName: aws.String(tableName),
	}

	result, err := dynamoDbClient.Scan(input)
	if err != nil {
		return nil, err
	}

	for _, item := range result.Items {
		project := new(Project)
		err = dynamodbattribute.UnmarshalMap(item, project)
		if err != nil {
			return nil, err
		}
		projects = append(projects, project)
	}

	return projects, nil
}
