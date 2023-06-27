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
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | (Optional) Whether Amazon S3 should block public ACLs for this bucket. | `bool` | n/a | yes |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | (Optional) Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | n/a | yes |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | (Required) S3 Bucket to which this Public Access Block configuration should be applied. | `string` | n/a | yes |
| <a name="input_company"></a> [company](#input\_company) | Name of the company hosting the resource. | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment. Allowed values: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | (Optional) Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"blueprint"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-west-2"` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | (Optional) Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | n/a | yes |

## Outputs

No outputs.
