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
| [aws_apigatewayv2_authorizer.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_authorizer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | (Required) API identifier. | `string` | n/a | yes |
| <a name="input_authorizer_type"></a> [authorizer\_type](#input\_authorizer\_type) | (Required) Authorizer type. Valid values: JWT, REQUEST | `string` | `"REQUEST"` | no |
| <a name="input_authorizer_uri"></a> [authorizer\_uri](#input\_authorizer\_uri) | (Optional) Authorizer's Uniform Resource Identifier (URI). | `string` | n/a | yes |
| <a name="input_company"></a> [company](#input\_company) | Name of the company hosting the resource. | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. Allowed values: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_identity_sources"></a> [identity\_sources](#input\_identity\_sources) | (Optional) Identity sources for which authorization is requested. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"blueprint"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_authorizer_id"></a> [authorizer\_id](#output\_authorizer\_id) | n/a |
