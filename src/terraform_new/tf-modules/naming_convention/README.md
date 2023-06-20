## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom"></a> [custom](#module\_custom) | cloudposse/label/null | 0.25.0 |
| <a name="module_root"></a> [root](#module\_root) | cloudposse/label/null | 0.25.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | Name of the company where the code will be hosted. | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. Allowed values: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"blueprint"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_company_context"></a> [company\_context](#output\_company\_context) | Custom context for naming based on inputs passed. Context with standard Company variables: `region` `component_name` `environment`. Does not consider services. |
| <a name="output_custom_context"></a> [custom\_context](#output\_custom\_context) | Custom context for naming based on inputs passed. Context with variables from the `cloudposse/label/null` module. Does not consider services. |
| <a name="output_custom_context_id"></a> [custom\_context\_id](#output\_custom\_context\_id) | Custom context ID string for naming based on inputs passed. Does not consider services. |
