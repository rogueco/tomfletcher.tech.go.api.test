## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_project_lambda"></a> [create\_project\_lambda](#module\_create\_project\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_create_project_lambda_api"></a> [create\_project\_lambda\_api](#module\_create\_project\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_delete_project_lambda"></a> [delete\_project\_lambda](#module\_delete\_project\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_delete_project_lambda_api"></a> [delete\_project\_lambda\_api](#module\_delete\_project\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | ./tf-modules/dynamodb_table | n/a |
| <a name="module_get_project_lambda"></a> [get\_project\_lambda](#module\_get\_project\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_get_project_lambda_api"></a> [get\_project\_lambda\_api](#module\_get\_project\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_get_projects_lambda"></a> [get\_projects\_lambda](#module\_get\_projects\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_get_projects_lambda_api"></a> [get\_projects\_lambda\_api](#module\_get\_projects\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_iam_policies"></a> [iam\_policies](#module\_iam\_policies) | ./tf-modules/iam_policies | n/a |
| <a name="module_lambda_bucket"></a> [lambda\_bucket](#module\_lambda\_bucket) | ./tf-modules/bucket_s3 | n/a |
| <a name="module_lambda_bucket_public_access"></a> [lambda\_bucket\_public\_access](#module\_lambda\_bucket\_public\_access) | ./tf-modules/bucket_s3_access_block | n/a |
| <a name="module_update_project_lambda"></a> [update\_project\_lambda](#module\_update\_project\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_update_project_lambda_api"></a> [update\_project\_lambda\_api](#module\_update\_project\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_upload_project_image_lambda"></a> [upload\_project\_image\_lambda](#module\_upload\_project\_image\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_upload_project_image_lambda_api"></a> [upload\_project\_image\_lambda\_api](#module\_upload\_project\_image\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_lambda"></a> [bucket\_lambda](#input\_bucket\_lambda) | n/a | `map(string)` | <pre>{<br>  "name": "lambda"<br>}</pre> | no |
| <a name="input_create_project_lambda"></a> [create\_project\_lambda](#input\_create\_project\_lambda) | n/a | `map(string)` | <pre>{<br>  "function_name": "CreateProject",<br>  "lambda_handler": "CreateProject",<br>  "zip_file": "createProject.zip"<br>}</pre> | no |
| <a name="input_create_project_lambda_api"></a> [create\_project\_lambda\_api](#input\_create\_project\_lambda\_api) | n/a | `map(string)` | <pre>{<br>  "http_method": "POST",<br>  "route": "/"<br>}</pre> | no |
| <a name="input_delete_project_lambda"></a> [delete\_project\_lambda](#input\_delete\_project\_lambda) | n/a | `map(string)` | <pre>{<br>  "function_name": "DeleteProject",<br>  "lambda_handler": "DeleteProject",<br>  "zip_file": "deleteProject.zip"<br>}</pre> | no |
| <a name="input_delete_project_lambda_api"></a> [delete\_project\_lambda\_api](#input\_delete\_project\_lambda\_api) | n/a | `map(string)` | <pre>{<br>  "http_method": "DELETE",<br>  "route": "/{projectId}"<br>}</pre> | no |
| <a name="input_get_project_lambda"></a> [get\_project\_lambda](#input\_get\_project\_lambda) | n/a | `map(string)` | <pre>{<br>  "function_name": "GetProject",<br>  "lambda_handler": "GetProject",<br>  "zip_file": "getProject.zip"<br>}</pre> | no |
| <a name="input_get_project_lambda_api"></a> [get\_project\_lambda\_api](#input\_get\_project\_lambda\_api) | n/a | `map(string)` | <pre>{<br>  "http_method": "GET",<br>  "route": "/{projectId}"<br>}</pre> | no |
| <a name="input_get_projects_lambda"></a> [get\_projects\_lambda](#input\_get\_projects\_lambda) | n/a | `map(string)` | <pre>{<br>  "function_name": "GetProjects",<br>  "lambda_handler": "GetProjects",<br>  "zip_file": "getProjects.zip"<br>}</pre> | no |
| <a name="input_get_projects_lambda_api"></a> [get\_projects\_lambda\_api](#input\_get\_projects\_lambda\_api) | n/a | `map(string)` | <pre>{<br>  "http_method": "GET",<br>  "route": "/{projectId}"<br>}</pre> | no |
| <a name="input_iam_policies"></a> [iam\_policies](#input\_iam\_policies) | n/a | `map(string)` | <pre>{<br>  "bucket": "test-project-uploaded-images"<br>}</pre> | no |
| <a name="input_lambda_bucket_public_access"></a> [lambda\_bucket\_public\_access](#input\_lambda\_bucket\_public\_access) | n/a | `map(bool)` | <pre>{<br>  "acls": true,<br>  "ignore_acls": true,<br>  "policy": true,<br>  "restrict": true<br>}</pre> | no |
| <a name="input_update_project_lambda"></a> [update\_project\_lambda](#input\_update\_project\_lambda) | n/a | `map(string)` | <pre>{<br>  "function_name": "UpdateProject",<br>  "lambda_handler": "UpdateProject",<br>  "zip_file": "updateProject.zip"<br>}</pre> | no |
| <a name="input_update_project_lambda_api"></a> [update\_project\_lambda\_api](#input\_update\_project\_lambda\_api) | n/a | `map(string)` | <pre>{<br>  "http_method": "PUT",<br>  "route": "/{projectId}"<br>}</pre> | no |
| <a name="input_upload_project_image_lambda"></a> [upload\_project\_image\_lambda](#input\_upload\_project\_image\_lambda) | n/a | `map(string)` | <pre>{<br>  "function_name": "UploadProjectImage",<br>  "lambda_handler": "UploadProjectImage",<br>  "zip_file": "uploadProjectImage.zip"<br>}</pre> | no |
| <a name="input_upload_project_image_lambda_api"></a> [upload\_project\_image\_lambda\_api](#input\_upload\_project\_image\_lambda\_api) | n/a | `map(string)` | <pre>{<br>  "http_method": "POST",<br>  "route": "/{projectId}/image"<br>}</pre> | no |

## Outputs

No outputs.
