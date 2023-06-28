variable "bucket_id" {
  type        = string
  description = "(Required) Name of the bucket that you want to associate this access point with."

}

variable "object_ownership" {
  type        = string
  description = "(Required) Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced"
  validation {
    condition     = contains(["BucketOwnerPreferred", "ObjectWriter", "BucketOwnerEnforced"], var.object_ownership)
    error_message = "Invalid value! Valid values are: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced"
  }
  default = "BucketOwnerPreferred"
}