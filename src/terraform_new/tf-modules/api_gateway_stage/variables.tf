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
    error_message = "Value invalid for environmet. Valid values: dev, uat, prd."
  }

  default = "dev"
}

variable "name" {
  type        = string
  description = "Application name."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "api_name" {
  type        = string
  description = "(Optional, Forces new resource) The name of the log group. If omitted, Terraform will assign a random, unique name."
}