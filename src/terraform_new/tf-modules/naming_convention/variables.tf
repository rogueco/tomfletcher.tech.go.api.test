variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "company" {
  type        = string
  description = "Name of the company where the code will be hosted."
  default     = "company"
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