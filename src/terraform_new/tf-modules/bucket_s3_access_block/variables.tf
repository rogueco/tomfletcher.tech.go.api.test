variable "region" {
  type        = string
  default     = "eu-west-2"
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
    error_message = "Value invalid for environmet. Valid values: dev, uat, prd."
  }

  default = "dev"
}

variable "bucket_id" {
  type        = string
  description = "(Required) S3 Bucket to which this Public Access Block configuration should be applied."
}


variable "block_public_acls" {
  type        = bool
  description = " (Optional) Whether Amazon S3 should block public ACLs for this bucket."

}

variable "block_public_policy" {
  type        = bool
  description = "(Optional) Whether Amazon S3 should block public bucket policies for this bucket."

}

variable "ignore_public_acls" {
  type        = bool
  description = "(Optional) Whether Amazon S3 should ignore public ACLs for this bucket."

}

variable "restrict_public_buckets" {
  type        = bool
  description = "(Optional) Whether Amazon S3 should restrict public bucket policies for this bucket."

}