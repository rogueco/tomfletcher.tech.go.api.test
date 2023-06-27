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
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | (Optional) Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY\_PER\_REQUEST | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | (Required, Forces new resource) Attribute to use as the hash (partition) key. | `string` | `"id"` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | (Required) Unique within a region name of the table. | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |
