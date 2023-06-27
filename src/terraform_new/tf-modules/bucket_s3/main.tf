resource "aws_s3_bucket" "this" {
  bucket        = local.name
  force_destroy = var.force_destroy
}