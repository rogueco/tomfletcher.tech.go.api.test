variable "user_pool_id" {
  type = string
  description = "(Required) The user pool ID of the user and group."
}

variable "group_name" {
  type = string
  description = "(Required) The name of the group to which the user is to be added.)"
}

variable "username" {
  type = string
  description = "(Required) The username of the user to be added to the group."
}