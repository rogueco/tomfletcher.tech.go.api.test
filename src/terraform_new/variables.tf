variable "bucket_lambda" {
  type = map(string)

  default = {
    "name" = "lambda"
  }
}

variable "iam_policies" {
  type = map(string)

  default = {
    "bucket" = "test-project-uploaded-images"
  }
}

variable "update_project_lambda" {
  type = map(string)

  default = {
    "zip_file"       = "updateProject.zip"
    "function_name"  = "UpdateProject"
    "lambda_handler" = "UpdateProject"
  }

}

variable "update_project_lambda_api" {
  type = map(string)

  default = {
    "http_method" = "PUT"
    "route"       = "/{projectId}"
  }

}

variable "lambda_bucket_public_access" {
  type = map(bool)

  default = {
    "acls"        = true
    "policy"      = true
    "ignore_acls" = true
    "restrict"    = true
  }
}

variable "create_project_lambda" {
  type = map(string)

  default = {
    "zip_file"       = "createProject.zip"
    "function_name"  = "CreateProject"
    "lambda_handler" = "CreateProject"
  }

}

variable "create_project_lambda_api" {
  type = map(string)

  default = {
    "http_method" = "POST"
    "route"       = "/"
  }

}

variable "upload_project_image_lambda" {
  type = map(string)

  default = {
    "zip_file"       = "uploadProjectImage.zip"
    "function_name"  = "UploadProjectImage"
    "lambda_handler" = "UploadProjectImage"
  }

}

variable "upload_project_image_lambda_api" {
  type = map(string)

  default = {
    "http_method" = "POST"
    "route"       = "/{projectId}/image"
  }
}

variable "get_project_lambda" {
  type = map(string)

  default = {
    "zip_file"       = "getProject.zip"
    "function_name"  = "GetProject"
    "lambda_handler" = "GetProject"
  }

}

variable "get_project_lambda_api" {
  type = map(string)

  default = {
    "http_method" = "GET"
    "route"       = "/{projectId}"
  }
}

variable "get_projects_lambda" {
  type = map(string)

  default = {
    "zip_file"       = "getProjects.zip"
    "function_name"  = "GetProjects"
    "lambda_handler" = "GetProjects"
  }

}

variable "get_projects_lambda_api" {
  type = map(string)

  default = {
    "http_method" = "GET"
    "route"       = "/{projectId}"
  }
}

variable "delete_project_lambda" {
  type = map(string)

  default = {
    "zip_file"       = "deleteProject.zip"
    "function_name"  = "DeleteProject"
    "lambda_handler" = "DeleteProject"
  }

}

variable "delete_project_lambda_api" {
  type = map(string)

  default = {
    "http_method" = "DELETE"
    "route"       = "/{projectId}"
  }
}

variable "uploaded_bucket" {
  type = map(string)

  default = {
    "name" = "test"
  }
}

variable "uploaded_bucket_public_access" {
  type = map(bool)

  default = {
    "acls"        = false
    "policy"      = true
    "ignore_acls" = true
    "restrict"    = true
  }
}

variable "cognito_user_pool" {
  type    = string
  default = "test"

}

variable "cognito_user_pool_client" {
  type    = string
  default = "test_client"

}

variable "cognito_user_group_admin" {
  type    = string
  default = "test_admin"

}

variable "cognito_user_group_admin_statement" {
  default = <<EOF
    {
      "Statement" : [
        {
          "Action" : "execute-api:Invoke",
          "Resource" : "arn:aws:execute-api:eu-west-2:123456789012:api-id/*"
        }
      ]
    }
  EOF
}

variable "cognito_user_group_standard" {
  type    = string
  default = "test_standard"
}

variable "cognito_user_group_standard_statement" {
  default = <<EOF
    {
      "Statement" : [
        {
          "actions" : ["execute-api:Invoke"],
          "resources" : ["arn:aws:execute-api:us-east-1:123456789012:api-id/*"],
          "conditions" : [
            {
              "test" : "StringEquals",
              "variable" : "aws:RequestedResourceTag/allowed-method",
              "values" : ["GET"]
            }
          ]
        }

      ]
    }
 EOF
}

variable "cognito_username_admin" {
  type    = string
  default = "adminUser"
}

variable "cognito_username_standard" {
  type    = string
  default = "standardUser"
}