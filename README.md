# tomfletcher.tech serverless application
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

### TODO:
- [x] Add `go.mod` files for each function, this will ensure that the binary is smaller, won't include unused packages. Plus, it will make the execution time shorter, therefor cheaper.
- [ ] Update Terraform code for the API Gateway to map to a custom domain name.
- [ ] Add a `Makefile` to the root of the project to make it easier to build and deploy the project.
- [ ] Look at how to add encryption to an S3 Bucket
- [X] Update the Lambda S3 Location to be private.
- [ ] Add Tests to the Lambda Functions
- [ ] Add the Postman testing collection to the source code.
- [ ] Look at Event Bridge to generate events between services.
- [ ] Add a CI/CD pipeline to the project.
- [ ] Add authentication to specific the API Gateway (terraform).

---

<br/>

```bash
export AWS_REGION=eu-west-2
```


```bash
terraform plan --out=test
```

### Pre-requisites
To run this application you will need the following installed on your machine:
- Terraform
- GOLANG
- AWS CLI
- AWS SAM CLI _(Optional)_

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
#### Local Debugging _beta_

> This hasn't been fully integrated into the project yet and it is a fucking nightmare to get working... 
```bash
sam build --hook-name terraform --beta-features  
```