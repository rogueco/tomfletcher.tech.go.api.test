resource "aws_cognito_user_group" "this" {
  name         = local.name
  user_pool_id = var.user_pool_id
  role_arn     = aws_iam_role.group_role.arn
}