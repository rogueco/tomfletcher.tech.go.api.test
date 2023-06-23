## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_object.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [archive_file.lambda_archive](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_bucket_id"></a> [lambda\_bucket\_id](#input\_lambda\_bucket\_id) | The id of the bucket lambda function code will be stored | `string` | n/a | yes |
| <a name="input_publish_dir"></a> [publish\_dir](#input\_publish\_dir) | The location of the published files. | `string` | n/a | yes |
| <a name="input_zip_file"></a> [zip\_file](#input\_zip\_file) | The location of the ZIP file | `string` | n/a | yes |

## Outputs

No outputs.
