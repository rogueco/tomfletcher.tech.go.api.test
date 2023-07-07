resource "aws_apigatewayv2_authorizer" "this" {
  api_id           = var.api_id
  authorizer_type  = var.authorizer_type
  authorizer_uri   = var.authorizer_uri
  identity_sources = var.identity_sources
  name             = local.name
}