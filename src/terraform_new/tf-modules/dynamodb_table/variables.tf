variable "table_name" {
  type        = string
  description = "(Required) Unique within a region name of the table."
  default     = "project"

}

variable "billing_mode" {
  type        = string
  description = "(Optional) Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST"
  validation {
    condition     = contains(["PROVISIONED", "PAY_PER_REQUEST"], var.billing_mode)
    error_message = "Value invalid for billing_mode. Valid values: PROVISIONED, PAY_PER_REQUEST."
  }

  default = "PAY_PER_REQUEST"
}

variable "hash_key" {
  type        = string
  description = "(Required, Forces new resource) Attribute to use as the hash (partition) key."
  default     = "id"
}