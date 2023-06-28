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

variable "username" {
  type        = string
  description = "(Required) The username for the user. Must be unique within the user pool. Must be a UTF-8 string between 1 and 128 characters. After the user is created, the username cannot be changed."
}

variable "user_pool_id" {
  type        = string
  description = "(Required) User pool the client belongs to."
}