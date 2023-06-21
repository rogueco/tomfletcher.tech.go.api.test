output "api_id" {
  value = aws_apigatewayv2_api.this.id
}

output "api_arn" {
  value = aws_apigatewayv2_api.this.execution_arn
}

output "api_name" {
  value = aws_apigatewayv2_api.this.name
}
