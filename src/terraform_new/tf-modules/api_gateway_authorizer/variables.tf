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

variable "name" {
  type        = string
  description = "Application name."
}

variable "api_id" {
  type        = string
  description = "(Required) API identifier."
}

variable "authorizer_type" {
  type        = string
  description = "(Required) Authorizer type. Valid values: JWT, REQUEST"

  validation {
    condition     = contains(["JWT", "REQUEST"], var.authorizer_type)
    error_message = "Value invalid for authorizer type. Valid values: JWT, REQUEST."
  }

  default = "REQUEST"
}

variable "authorizer_uri" {
  type        = string
  description = "(Optional) Authorizer's Uniform Resource Identifier (URI)."
}

variable "identity_sources" {
  type        = string
  description = "(Optional) Identity sources for which authorization is requested."
}