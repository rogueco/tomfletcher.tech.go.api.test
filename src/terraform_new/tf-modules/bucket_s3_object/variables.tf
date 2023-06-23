variable "publish_dir" {
  description = "The location of the published files."
  type        = string
}

variable "zip_file" {
  description = "The location of the ZIP file"
  type        = string
}

variable "lambda_bucket_id" {
  description = "The id of the bucket lambda function code will be stored"
  type        = string
}
