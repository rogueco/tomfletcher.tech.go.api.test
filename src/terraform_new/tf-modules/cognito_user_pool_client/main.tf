resource "aws_cognito_user_pool_client" "this" {
  name         = local.name
  user_pool_id = var.user_pool_id
}