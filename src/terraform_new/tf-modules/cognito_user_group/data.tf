data "aws_iam_policy_document" "policy" {
  count     = length(var.policy_statement)
  statement = jsondecode(var.policy_statement[count.index])
}