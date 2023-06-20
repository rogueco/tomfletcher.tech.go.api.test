variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"

}

variable "company" {
  type        = string
  default     = "company"
  description = "Name of the company hosting the resource."
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "blueprint"
}

variable "environment" {
  type        = string
  description = "Environment. Allowed values: `dev`, `uat` , `prd`"

  validation {
    condition     = contains(["dev", "uat", "prd"], var.environment)
    error_message = "Value for invalid environmet. Valid values: dev, uat, prd."
  }

  default = "dev"
}

variable "name" {
  type        = string
  description = "Application name."
}

variable "iam_policy_lambda" {
  description = "(Required) - The ARN of the policy you want to apply"
  default = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]

}

variable "environment_variables" {
  type        = map(string)
  description = "Environment variables to pass to the Lambda function"
}

variable "lambda_handler" {
  type        = string
  description = "The Lambda handler, defined as classlib::namespace.class::method"

}

variable "source_code_hash" {
  type        = string
  description = "(Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
}