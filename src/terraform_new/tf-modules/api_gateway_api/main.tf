resource "aws_apigatewayv2_api" "this" {
  name          = local.name
  protocol_type = var.protocol_type
}