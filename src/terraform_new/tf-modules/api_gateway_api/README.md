## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../../naming_convention | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | Name of the company hosting the resource. | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. Allowed values: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_name"></a> [name](#input\_name) | Application name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"blueprint"` | no |
| <a name="input_protocol_type"></a> [protocol\_type](#input\_protocol\_type) | (Required) API protocol. Valid values: HTTP, WEBSOCKET. | `string` | `"HTTP"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_arn"></a> [api\_arn](#output\_api\_arn) | n/a |
| <a name="output_api_id"></a> [api\_id](#output\_api\_id) | n/a |
