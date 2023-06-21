variable "api_id" {
  description = "The ID of the HTTP API to attach to."
  type        = string
}

variable "api_arn" {
  description = "The ARN of the HTTP API to attach to."
  type        = string
}

variable "function_arn" {
  description = "(Optional) URI of the Lambda function for a Lambda proxy integration"
  type        = string
}

variable "function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "http_method" {
  description = "The HTTP method to use (GET, PUT, POST, DELETE)."
  type        = string
}

variable "route" {
  description = "The API route."
  type        = string
}

variable "integration_type" {
  type        = string
  description = "(Required) Integration type of an integration. Valid values: AWS, AWS_PROXY, HTTP, HTTP_PROXY, MOCK. For an HTTP API private integration, use HTTP_PROXY."

  validation {
    condition     = contains(["AWS", "AWS_PROXY", "HTTP", "HTTP_PROXY", "MOCK"], var.integration_type)
    error_message = "Value invalid for integration_type. Valid values: AWS, AWS_PROXY, HTTP, HTTP_PROXY, MOCK."
  }
  default = "AWS_PROXY"
}