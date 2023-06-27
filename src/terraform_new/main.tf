# Create bucket S3
module "lambda_bucket" {
  source = "./tf-modules/bucket_s3"

  name          = var.lambda_bucket["name"]
  force_destroy = true
}

module "lambda_bucket_public_access" {
  source = "./tf-modules/bucket_s3_access_block"

  bucket_id = module.lambda_bucket.id
  block_public_acls = var.lambda_bucket_public_access["acls"]
  block_public_policy = var.lambda_bucket_public_access["policy"]
  ignore_public_acls = var.lambda_bucket_public_access["ignore_acls"]
  restrict_public_buckets = var.lambda_bucket_public_access["restrict"]
}

# Create DynamoDB Table
module "dynamodb_table" {
  source = "./tf-modules/dynamodb_table"

}

# Create IAM policies
module "iam_policies" {
  source = "./tf-modules/iam_policies"

  table_name  = module.dynamodb_table.name
  bucket_name = var.iam_policies["bucket"]
}

# Update Product Lambda
module "update_project_lambda" {
  source = "./tf-modules/lambda_function"

  lambda_bucket_id = module.lambda_bucket.function_id
  publish_dir      = "${path.module}/../build/UpdateProject"
  zip_file         = var.update_project_lambda["zip_file"]
  function_name    = var.update_project_lambda["function_name"]
  lambda_handler   = var.update_project_lambda["lambda_handler"]
  arn_list = concat(module.iam_policies.dynamo_db_write, module.iam_policies.dynamo_db_read, module.iam_policies.cloud_watch_put_metrics)

  environment_variables = {
    "PRODUCT_TABLE_NAME" = module.dynamodb_table.name
  }
}

module "update_project_lambda_api" {
  source = "./tf-modules/api_gateway_lambda_integration"

  api_id        = module.api_gateway.api_id
  api_arn       = module.api_gateway.api_arn
  function_arn  = module.update_project_lambda.function_arn
  function_name = module.update_project_lambda.function_name
  http_method   = var.update_project_lambda_api["http_method"]
  route         = var.upload_project_image_lambda_api["route"]
}

# Create Product Lambda
module "create_project_lambda" {
  source = "./tf-modules/lambda_function"

  lambda_bucket_id = module.lambda_bucket.id
  publish_dir = "${path.module}/../build/CreateProject"
  zip_file = var.create_project_lambda["zip_file"]
  function_name = var.create_project_lambda["function_name"]
  lambda_handler = var.create_project_lambda["lambda_handler"]
  arn_list = concat(module.iam_policies.dynamo_db_write, module.iam_policies.cloud_watch_put_metrics)
  
  environment_variables = {
    "PRODUCT_TABLE_NAME" = module.dynamodb_table.name
  }
}

module "create_project_lambda_api" {
  source = "./tf-modules/api_gateway_lambda_integration"

  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.create_project_lambda.function_arn
  function_name = module.create_project_lambda.function_name
  http_method = var.create_project_lambda_api["http_method"]
  route = var.create_project_lambda_api["route"]
}

# Create Product Lambda
module "upload_project_image_lambda" {
  source = "./tf-modules/lambda_function"

  lambda_bucket_id = module.lambda_bucket.id
  publish_dir = "${path.module}/../build/UploadProjectImage"
  zip_file = var.upload_project_image_lambda["zip_file"]
  function_name = var.upload_project_image_lambda["function_name"]
  lambda_handler = var.upload_project_image_lambda["lambda_handler"]
  arn_list = concat(module.iam_policies.dynamo_db_write, module.iam_policies.dynamo_db_read, module.iam_policies.s3_bucket_write, module.iam_policies.cloud_watch_put_metrics)
  
  environment_variables = {
    "PRODUCT_TABLE_NAME" = module.dynamodb_table.name
  }

}

module "upload_project_image_lambda_api" {
  source = "./tf-modules/api_gateway_lambda_integration"

  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.upload_project_image_lambda.function_arn
  function_name = module.upload_project_image_lambda.function_name
  http_method = var.upload_project_image_lambda_api["http_method"]
  route = var.upload_project_image_lambda_api["route"]
}

# Get Product Lambda
module "get_project_lambda" {
  source = "./tf-modules/lambda_function"

  lambda_bucket_id = module.lambda_bucket.id
  publish_dir = "${path.module}/../build/GetProject"
  zip_file = var.get_project_lambda["zip_file"]
  function_name = var.get_project_lambda["function_name"]
  lambda_handler = var.get_project_lambda["lambda_handler"]
  arn_list = concat(module.iam_policies.dynamo_db_read, module.iam_policies.cloud_watch_put_metrics)
  
  environment_variables = {
    "PROJECT_TABLE_NAME" = module.dynamodb_table.name
  }
}

module "get_project_lambda_api" {
  source = "./tf-modules/api_gateway_lambda_integration"

  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.get_project_lambda.function_arn
  function_name = module.get_project_lambda.function_name
  http_method = var.get_project_lambda_api["http_method"]
  route = var.get_project_lambda_api["route"]
}

# Get all projects Lambda
module "get_projects_lambda" {
  source = "./tf-modules/lambda_function"

  lambda_bucket_id = module.lambda_bucket.id
  publish_dir = "${path.module}/../build/GetProjects"
  zip_file = var.get_projects_lambda["zip_file"]
  function_name = var.get_projects_lambda["function_name"]
  lambda_handler = var.get_projects_lambda["lambda_handler"]
  arn_list = concat(module.iam_policies.dynamo_db_read, module.iam_policies.cloud_watch_put_metrics)
  
  environment_variables = {
    "PROJECT_TABLE_NAME" = module.dynamodb_table.name
  }
}

module "get_projects_lambda_api" {
  source = "./tf-modules/api_gateway_lambda_integration"

  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.get_projects_lambda.function_arn
  function_name = module.get_projects_lambda.function_name
  http_method = var.get_projects_lambda_api["http_method"]
  route = var.get_projects_lambda_api["route"]
}

# Delete Project lambda
module "delete_project_lambda" {
  source = "./tf-modules/lambda_function"

  lambda_bucket_id = module.lambda_bucket.id
  publish_dir = "${path.module}/../build/DeleteProject"
  zip_file = var.delete_project_lambda["zip_file"]
  function_name = var.delete_project_lambda["function_name"]
  lambda_handler = var.delete_project_lambda["lambda_handler"]
  arn_list = concat(module.iam_policies.dynamo_db_delete, module.iam_policies.cloud_watch_put_metrics)

  environment_variables = {
    "PROJECT_TABLE_NAME" = aws_dynamodb_table.test_dynamodb.name
  }
}

module "delete_project_lambda_api" {
  source = "./tf-modules/api_gateway_lambda_integration"

  api_id = module.api_gateway.api_id
  api_arn = module.api_gateway.api_arn
  function_arn = module.delete_project_lambda.function_arn
  function_name = module.delete_project_lambda.function_name
  http_method = var.delete_project_lambda_api["http_method"]
  route = var.delete_project_lambda_api["route"]
}