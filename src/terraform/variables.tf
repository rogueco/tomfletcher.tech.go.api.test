variable "table_name" {
  description = "The name of the DyanamoDB table"
  type        = string
  default = "project"
}

variable "code_bucket_name" {
  description = "The name of the S3 bucket to store Lambda source code"
  type        = string
  default = "tom-fletcher-lambda-code"
}