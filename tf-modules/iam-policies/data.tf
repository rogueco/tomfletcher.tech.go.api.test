data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "dynamo_db_read" {
  statement {
    actions = [
      "dynamodb:GetItem", "dynamodb:Scan", "dynamodb:Query", "dynamodb:BatchGetItem", "dynamodb:DescribeTable"
    ]
    resources = [
      "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/${var.table_name}",
      "arn:aws:dynamodb:*:*:table/${var.table_name}/*"
    ]
  }
}

data "aws_iam_policy_document" "dynamo_db_write" {
  statement {
    actions = [
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:BatchWriteItem"
    ]
    resources = [
      "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/${var.table_name}",
      "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/${var.table_name}/*"
    ]
  }
}


data "aws_iam_policy_document" "dynamo_db_delete" {
  statement {
    actions   = ["dynamodb:DeleteItem"]
    resources = [
      "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/${var.table_name}",
      "arn:aws:dynamodb:*:${data.aws_caller_identity.current.account_id}:table/${var.table_name}/*"
    ]
  }
}

data "aws_iam_policy_document" "cloud_watch_put_metrics" {
  statement {
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]
  }
}


### S3 Bucket Policy
#data "aws_iam_policy_document" "s3_bucket_write" {
#  statement {
#    actions = [
#      "s3:PutObject",
#      "s3:GetObject",
#      "s3:List",
#      "s3:GetObjectVersion",
#      "s3:DeleteObject",
#      "s3:DeleteObjectVersion",
#      "s3:*",
#      "s3-object-lambda:*"
#    ]
#    resources = [
#      "arn:aws:s3:::${var.bucket_name}",
#      "arn:aws:s3:::${var.bucket_name}/*",
#      "arn:aws:s3:::*"
#    ]
#  }
#}
#

