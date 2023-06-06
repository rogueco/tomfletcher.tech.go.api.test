resource "aws_dynamodb_table" "test_dynamodb" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

# Create S3 bucket to store our application source code.
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.code_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket_public_access" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Initialize module containing IAM policies.
module "iam_policies" {
  source = "./tf-modules/iam-policies"
  table_name = aws_dynamodb_table.test_dynamodb.name
  bucket_name = "test-project-uploaded-images"
}

# Update Product Lambda
module "update_project_lambda" {
  source = "./tf-modules/lambda-function"
  lambda_bucket_id = aws_s3_bucket.lambda_bucket.id
  publish_dir = "${path.module}/../build/UpdateProject"
  zip_file = "updateProject.zip"
  function_name = "UpdateProject"
  lambda_handler = "UpdateProject"
  environment_variables = {
    "PRODUCT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "update_project_lambda_api" {
  source = "./tf-modules/api-gateway-lambda-integration"
  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.update_project_lambda.function_arn
  function_name = module.update_project_lambda.function_name
  http_method = "PUT"
  route = "/{projectId}"
}

resource "aws_iam_role_policy_attachment" "update_product_lambda_dynamo_db_write" {
  role       = module.update_project_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_write
}

resource "aws_iam_role_policy_attachment" "update_product_lambda_dynamo_db_read" {
  role       = module.update_project_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_read
}

resource "aws_iam_role_policy_attachment" "update_product_lambda_cw_metrics" {
  role       = module.update_project_lambda.function_role_name
  policy_arn = module.iam_policies.cloud_watch_put_metrics
}

# Create Product Lambda
module "create_project_lambda" {
  source = "./tf-modules/lambda-function"
  lambda_bucket_id = aws_s3_bucket.lambda_bucket.id
  publish_dir = "${path.module}/../build/CreateProject"
  zip_file = "createProject.zip"
  function_name = "CreateProject"
  lambda_handler = "CreateProject"
  environment_variables = {
    "PRODUCT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "create_project_lambda_api" {
  source = "./tf-modules/api-gateway-lambda-integration"
  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.create_project_lambda.function_arn
  function_name = module.create_project_lambda.function_name
  http_method = "POST"
  route = "/"
}

resource "aws_iam_role_policy_attachment" "create_product_lambda_dynamo_db_write" {
  role       = module.create_project_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_write
}

resource "aws_iam_role_policy_attachment" "create_product_lambda_cw_metrics" {
  role       = module.create_project_lambda.function_role_name
  policy_arn = module.iam_policies.cloud_watch_put_metrics
}

# Create Product Lambda
module "upload_project_image_lambda" {
  source = "./tf-modules/lambda-function"
  lambda_bucket_id = aws_s3_bucket.lambda_bucket.id
  publish_dir = "${path.module}/../build/UploadProjectImage"
  zip_file = "uploadProjectImage.zip"
  function_name = "UploadProjectImage"
  lambda_handler = "UploadProjectImage"
  environment_variables = {
    "PRODUCT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "upload_project_image_lambda_api" {
  source = "./tf-modules/api-gateway-lambda-integration"
  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.upload_project_image_lambda.function_arn
  function_name = module.upload_project_image_lambda.function_name
  http_method = "POST"
  route = "/{projectId}/image"
}

resource "aws_iam_role_policy_attachment" "upload_project_image_lambda_dynamo_db_write" {
  role       = module.upload_project_image_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_write
}

resource "aws_iam_role_policy_attachment" "upload_project_image_lambda_dynamo_db_read" {
  role       = module.upload_project_image_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_read
}

resource "aws_iam_role_policy_attachment" "upload_project_image_lambda_s3_write" {
  role       = module.upload_project_image_lambda.function_role_name
  policy_arn = module.iam_policies.s3_bucket_write
}


resource "aws_iam_role_policy_attachment" "upload_project_image_lambda_cw_metrics" {
  role       = module.upload_project_image_lambda.function_role_name
  policy_arn = module.iam_policies.cloud_watch_put_metrics
}

# Get Product Lambda
module "get_project_lambda" {
  source = "./tf-modules/lambda-function"
  lambda_bucket_id = aws_s3_bucket.lambda_bucket.id
  publish_dir = "${path.module}/../build/GetProject"
  zip_file = "getProject.zip"
  function_name = "GetProject"
  lambda_handler = "GetProject"
  environment_variables = {
    "PROJECT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "get_project_lambda_api" {
  source = "./tf-modules/api-gateway-lambda-integration"
  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.get_project_lambda.function_arn
  function_name = module.get_project_lambda.function_name
  http_method = "GET"
  route = "/{projectId}"
}

resource "aws_iam_role_policy_attachment" "create_product_lambda_dynamo_db_read" {
  role       = module.get_project_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_read
}

resource "aws_iam_role_policy_attachment" "get_product_lambda_cw_metrics" {
  role       = module.get_project_lambda.function_role_name
  policy_arn = module.iam_policies.cloud_watch_put_metrics
}

# Get all projects Lambda
module "get_projects_lambda" {
  source = "./tf-modules/lambda-function"
  lambda_bucket_id = aws_s3_bucket.lambda_bucket.id
  publish_dir = "${path.module}/../build/GetProjects"
  zip_file = "getProjects.zip"
  function_name = "GetProjects"
  lambda_handler = "GetProjects"
  environment_variables = {
    "PROJECT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "get_projects_lambda_api" {
  source = "./tf-modules/api-gateway-lambda-integration"
  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.get_projects_lambda.function_arn
  function_name = module.get_projects_lambda.function_name
  http_method = "GET"
  route = "/"
}

resource "aws_iam_role_policy_attachment" "get_products_lambda_dynamo_db_read" {
  role       = module.get_projects_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_read
}

resource "aws_iam_role_policy_attachment" "get_products_lambda_cw_metrics" {
  role       = module.get_projects_lambda.function_role_name
  policy_arn = module.iam_policies.cloud_watch_put_metrics
}

# Delete Project lambda
module "delete_project_lambda" {
  source = "./tf-modules/lambda-function"
  lambda_bucket_id = aws_s3_bucket.lambda_bucket.id
  publish_dir = "${path.module}/../build/DeleteProject"
  zip_file = "deleteProject.zip"
  function_name = "DeleteProject"
  lambda_handler = "DeleteProject"
  environment_variables = {
    "PROJECT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "delete_project_lambda_api" {
  source = "./tf-modules/api-gateway-lambda-integration"
  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.delete_project_lambda.function_arn
  function_name = module.delete_project_lambda.function_name
  http_method = "DELETE"
  route = "/{projectId}"
}

resource "aws_iam_role_policy_attachment" "delete_product_lambda_dynamo_db_delete" {
  role       = module.delete_project_lambda.function_role_name
  policy_arn = module.iam_policies.dynamo_db_delete
}

resource "aws_iam_role_policy_attachment" "delete_product_lambda_cw_metrics" {
  role       = module.delete_project_lambda.function_role_name
  policy_arn = module.iam_policies.cloud_watch_put_metrics
}


## S3 Bucket for uploaded images
resource "aws_s3_bucket" "test-project-uploaded-images" {
  bucket = "test-project-uploaded-images"
}

resource "aws_s3_bucket_ownership_controls" "tomtech-project-uploaded-images_ownership" {
  bucket = aws_s3_bucket.test-project-uploaded-images.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

data "aws_canonical_user_id" "current" {

}

resource "aws_s3_bucket_acl" "test-project-uploaded-images_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.tomtech-project-uploaded-images_ownership]

  bucket = aws_s3_bucket.test-project-uploaded-images.id
  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.test-project-uploaded-images.id

  block_public_acls       = false
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#  bucket =
#  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
#}

#data "aws_iam_policy_document" "allow_access_from_another_account" {
#  statement {
#    principals {
#      type        = "AWS"
#      identifiers = [""]
#    }
#
#    actions = [
#      "s3:GetObject",
#      "s3:ListBucket",
#      "s3:PutObject",
#    ]
#
#    resources = [
#    ]
#  }
#}




module "api_gateway" {
  source = "./tf-modules/api-gateway"
  api_name = "project-api"
  stage_name = "dev"
  stage_auto_deploy = true
}
