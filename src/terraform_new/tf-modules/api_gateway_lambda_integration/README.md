## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_integration.lambda_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route.get_product_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_lambda_permission.get_lambda_api_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_arn"></a> [api\_arn](#input\_api\_arn) | The ARN of the HTTP API to attach to. | `string` | n/a | yes |
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | The ID of the HTTP API to attach to. | `string` | n/a | yes |
| <a name="input_function_arn"></a> [function\_arn](#input\_function\_arn) | (Optional) URI of the Lambda function for a Lambda proxy integration | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The name of the Lambda function. | `string` | n/a | yes |
| <a name="input_http_method"></a> [http\_method](#input\_http\_method) | The HTTP method to use (GET, PUT, POST, DELETE). | `string` | n/a | yes |
| <a name="input_integration_type"></a> [integration\_type](#input\_integration\_type) | (Required) Integration type of an integration. Valid values: AWS, AWS\_PROXY, HTTP, HTTP\_PROXY, MOCK. For an HTTP API private integration, use HTTP\_PROXY. | `string` | `"AWS_PROXY"` | no |
| <a name="input_route"></a> [route](#input\_route) | The API route. | `string` | n/a | yes |

## Outputs

No outputs.
