## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cognito_user_admin"></a> [cognito\_user\_admin](#module\_cognito\_user\_admin) | ./tf-modules/cognito_user | n/a |
| <a name="module_cognito_user_admin_group_attachment"></a> [cognito\_user\_admin\_group\_attachment](#module\_cognito\_user\_admin\_group\_attachment) | ./tf-modules/cognito_user_in_group | n/a |
| <a name="module_cognito_user_group_admin"></a> [cognito\_user\_group\_admin](#module\_cognito\_user\_group\_admin) | ./tf-modules/cognito_user_group | n/a |
| <a name="module_cognito_user_group_standard"></a> [cognito\_user\_group\_standard](#module\_cognito\_user\_group\_standard) | ./tf-modules/cognito_user_group | n/a |
| <a name="module_cognito_user_pool"></a> [cognito\_user\_pool](#module\_cognito\_user\_pool) | ./tf-modules/cognito_user_pool | n/a |
| <a name="module_cognito_user_pool_client"></a> [cognito\_user\_pool\_client](#module\_cognito\_user\_pool\_client) | ./tf-modules/cognito_user_pool_client | n/a |
| <a name="module_cognito_user_standard"></a> [cognito\_user\_standard](#module\_cognito\_user\_standard) | ./tf-modules/cognito_user | n/a |
| <a name="module_cognito_user_standard_group_attachment"></a> [cognito\_user\_standard\_group\_attachment](#module\_cognito\_user\_standard\_group\_attachment) | ./tf-modules/cognito_user_in_group | n/a |
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
| <a name="module_project_uploaded_images_acl"></a> [project\_uploaded\_images\_acl](#module\_project\_uploaded\_images\_acl) | ./tf-modules/bucket_s3_acl | n/a |
| <a name="module_project_uploaded_images_ownership"></a> [project\_uploaded\_images\_ownership](#module\_project\_uploaded\_images\_ownership) | ./tf-modules/bucket_s3_ownership_controls | n/a |
| <a name="module_update_project_lambda"></a> [update\_project\_lambda](#module\_update\_project\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_update_project_lambda_api"></a> [update\_project\_lambda\_api](#module\_update\_project\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_upload_project_image_lambda"></a> [upload\_project\_image\_lambda](#module\_upload\_project\_image\_lambda) | ./tf-modules/lambda_function | n/a |
| <a name="module_upload_project_image_lambda_api"></a> [upload\_project\_image\_lambda\_api](#module\_upload\_project\_image\_lambda\_api) | ./tf-modules/api_gateway_lambda_integration | n/a |
| <a name="module_uploaded_bucket"></a> [uploaded\_bucket](#module\_uploaded\_bucket) | ./tf-modules/bucket_s3 | n/a |
| <a name="module_uploaded_bucket_public_access"></a> [uploaded\_bucket\_public\_access](#module\_uploaded\_bucket\_public\_access) | ./tf-modules/bucket_s3_access_block | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_lambda"></a> [bucket\_lambda](#input\_bucket\_lambda) | n/a | `map(string)` | <pre>{<br>  "name": "lambda"<br>}</pre> | no |
| <a name="input_cognito_user_group_admin"></a> [cognito\_user\_group\_admin](#input\_cognito\_user\_group\_admin) | n/a | `string` | `"test_admin"` | no |
| <a name="input_cognito_user_group_admin_statement"></a> [cognito\_user\_group\_admin\_statement](#input\_cognito\_user\_group\_admin\_statement) | n/a | `string` | `"    {\n      \"Statement\" : [\n        {\n          \"Action\" : \"execute-api:Invoke\",\n          \"Resource\" : \"arn:aws:execute-api:eu-west-2:123456789012:api-id/*\"\n        }\n      ]\n    }\n"` | no |
| <a name="input_cognito_user_group_standard"></a> [cognito\_user\_group\_standard](#input\_cognito\_user\_group\_standard) | n/a | `string` | `"test_standard"` | no |
| <a name="input_cognito_user_group_standard_statement"></a> [cognito\_user\_group\_standard\_statement](#input\_cognito\_user\_group\_standard\_statement) | n/a | `string` | `"    {\n      \"Statement\" : [\n        {\n          \"actions\" : [\"execute-api:Invoke\"],\n          \"resources\" : [\"arn:aws:execute-api:us-east-1:123456789012:api-id/*\"],\n          \"conditions\" : [\n            {\n              \"test\" : \"StringEquals\",\n              \"variable\" : \"aws:RequestedResourceTag/allowed-method\",\n              \"values\" : [\"GET\"]\n            }\n          ]\n        }\n\n      ]\n    }\n"` | no |
| <a name="input_cognito_user_pool"></a> [cognito\_user\_pool](#input\_cognito\_user\_pool) | n/a | `string` | `"test"` | no |
| <a name="input_cognito_user_pool_client"></a> [cognito\_user\_pool\_client](#input\_cognito\_user\_pool\_client) | n/a | `string` | `"test_client"` | no |
| <a name="input_cognito_username_admin"></a> [cognito\_username\_admin](#input\_cognito\_username\_admin) | n/a | `string` | `"adminUser"` | no |
| <a name="input_cognito_username_standard"></a> [cognito\_username\_standard](#input\_cognito\_username\_standard) | n/a | `string` | `"standardUser"` | no |
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
| <a name="input_uploaded_bucket"></a> [uploaded\_bucket](#input\_uploaded\_bucket) | n/a | `map(string)` | <pre>{<br>  "name": "test"<br>}</pre> | no |
| <a name="input_uploaded_bucket_public_access"></a> [uploaded\_bucket\_public\_access](#input\_uploaded\_bucket\_public\_access) | n/a | `map(bool)` | <pre>{<br>  "acls": false,<br>  "ignore_acls": true,<br>  "policy": true,<br>  "restrict": true<br>}</pre> | no |

## Outputs

No outputs.
