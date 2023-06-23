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
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.lambda_bucket_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | Name of the company hosting the resource. | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. Allowed values: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional) Boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Application name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"blueprint"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-west-2"` | no |

## Outputs

No outputs.
