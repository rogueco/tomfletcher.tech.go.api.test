output "function_arn" {
  value       = aws_lambda_function.this.arn
  description = "The arn of the lambda function."
}

output "function_name" {
  value       = aws_lambda_function.this.function_name
  description = "The name of the lambda function."
}

output "function_role_arn" {
  value       = aws_lambda_function.this.role
  description = "Arn for lambda function role"
}

output "function_role_name" {
  value       = aws_iam_role.lambda_function_role.name
  description = "Name for lambda function role"
}