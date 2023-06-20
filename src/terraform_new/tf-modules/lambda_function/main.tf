resource "aws_lambda_function" "this" {
  function_name    = local.name
  s3_bucket        = var.lambda_bucket_id
  s3_key           = var.lambda_s3_key
  runtime          = "go1.x"
  handler          = var.lambda_handler
  source_code_hash = var.source_code_hash
  role             = aws_iam_role.lambda_function_role.arn
  timeout          = 30
  memory_size      = 128
  dynamic "environment" {
    for_each = length(var.environment_variables) > 0 ? [1] : []
    content {
      variables = var.environment_variables
    }
  }
}
