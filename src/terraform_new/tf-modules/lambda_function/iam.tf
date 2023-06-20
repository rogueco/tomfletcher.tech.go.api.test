resource "aws_iam_role" "lambda_function_role" {
  name               = local.name_role
  description        = "Role for Lambda Functions"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
  tags = {
    Name = local.name_role
  }
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_function_role.name
  count      = length(var.iam_policy_lambda)
  policy_arn = var.iam_policy_lambda[count.index]
}
