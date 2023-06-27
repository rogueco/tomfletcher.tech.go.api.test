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
      "acls" = true
      "policy" = true
      "ignore_acls" = true
      "restrict" = true
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
    "route" = "/{projectId}/image"
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
    "route" = "/{projectId}"
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
    "route" = "/{projectId}"
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
    "route" = "/{projectId}"
  }
}
