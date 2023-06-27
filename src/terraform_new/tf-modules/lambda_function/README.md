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
| [aws_cloudwatch_log_group.aggregator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.lambda_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_policy_attach_others](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_iam_policy_document.lambda_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arn_list"></a> [arn\_list](#input\_arn\_list) | List of policies to be attached | `list(string)` | `[]` | no |
| <a name="input_company"></a> [company](#input\_company) | Name of the company hosting the resource. | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. Allowed values: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables to pass to the Lambda function | `map(string)` | n/a | yes |
| <a name="input_iam_policy_lambda"></a> [iam\_policy\_lambda](#input\_iam\_policy\_lambda) | (Required) - The ARN of the policy you want to apply | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"<br>]</pre> | no |
| <a name="input_lambda_handler"></a> [lambda\_handler](#input\_lambda\_handler) | The Lambda handler, defined as classlib::namespace.class::method | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"blueprint"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-west-2"` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | (Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3\_key. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_arn"></a> [function\_arn](#output\_function\_arn) | The arn of the lambda function. |
| <a name="output_function_id"></a> [function\_id](#output\_function\_id) | ID for lambda function role |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | The name of the lambda function. |
| <a name="output_function_role_arn"></a> [function\_role\_arn](#output\_function\_role\_arn) | Arn for lambda function role |
| <a name="output_function_role_name"></a> [function\_role\_name](#output\_function\_role\_name) | Name for lambda function role |
