resource "aws_apigatewayv2_api" "example" {
  name          = "my-api"  # Replace with your desired API name
  protocol_type = "HTTP"

  # Other API settings as needed
}

resource "aws_apigatewayv2_authorizer" "example" {
  api_id       = aws_apigatewayv2_api.example.id
  name         = "my-authorizer"  # Replace with your desired authorizer name
  authorizer_type = "JWT"
  identity_source = "$request.header.Authorization"
  jwt_configuration {
    audience = [aws_cognito_user_pool.example.client_id]
    issuer   = aws_cognito_user_pool.example.issuer
  }
}

resource "aws_apigatewayv2_route" "example" {
  api_id    = aws_apigatewayv2_api.example.id
  route_key = "GET /my-resource"  # Replace with your desired route key

  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.example.id
  target             = "integrations/${aws_apigatewayv2_integration.example.id}"
}

resource "aws_apigatewayv2_integration" "example" {
  api_id                 = aws_apigatewayv2_api.example.id
  integration_type       = "AWS_PROXY"
  integration_uri        = "arn:aws:lambda:us-east-1:123456789012:function:my-lambda-function"  # Replace with your Lambda function ARN
  integration_method     = "GET"  # Replace with your desired integration method
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_stage" "example" {
  api_id      = aws_apigatewayv2_api.example.id
  name        = "prod"  # Replace with your desired stage name
  auto_deploy = true
}
