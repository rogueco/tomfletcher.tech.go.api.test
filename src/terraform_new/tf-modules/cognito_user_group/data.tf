data "aws_iam_policy_document" "policy" {
  statement = var.policy_statement
}