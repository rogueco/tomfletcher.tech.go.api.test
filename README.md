### Summary
This is a serverless application that is hosted on AWS. The application is built using Terraform and Golang. The application is a simple API that allows you to create, read, update and delete blog posts. The application is built using the following AWS services:
- API Gateway
- Lambda
- DynamoDB _(on demand)_
- S3
- CloudWatch
- Route53 _(TODO)_
- AWS Certificate Manager _(TODO)_
- CloudFront _(TODO)_



### Getting Started

From the src folder, run the following command to build the application:

MacOS:
```bash
build.sh
```

powershell:
```bash
.\build.ps1
```


Navigate to the terrform directory
```bash
terraform init
terraform plan --out=development
terraform apply "development"
```
---

<br/>

```bash
export AWS_REGION=eu-west-2
```

### Pre-requisites
To run this application you will need the following installed on your machine:
- Terraform
- GOLANG
- AWS CLI

#### GO
- [GO Downlaond](https://golang.org/dl/)

#### Terraform 

Windows:
```bash
choco install terraform
```
 MacOS:
```bash
brew install terraform
```

#### AWS CLI
- [AWS Download Link](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

#### AWS SAM CLI
  - [AWS Download Link](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html)
  - [Better together: AWS SAM CLI and HashiCorp Terraform](https://aws.amazon.com/blogs/compute/better-together-aws-sam-cli-and-hashicorp-terraform/)
  - [GH: AWS Sample Repo](https://github.com/aws-samples/aws-sam-terraform-examples)


#### Repository Notes
`.gitignore` file generated from [Toptal](https://www.toptal.com/developers/gitignore).


---

