resource "aws_cognito_user_in_group" "this" {
  user_pool_id = var.user_pool_id
  group_name   = var.group_name
  username     = var.username
}