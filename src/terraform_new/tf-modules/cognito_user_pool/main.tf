resource "aws_cognito_user_pool" "this" {
  name = local.name
}