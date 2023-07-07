resource "aws_iam_role" "group_role" {
  count              = length(var.policy_statement)
  name               = local.name_role
  assume_role_policy = data.aws_iam_policy_document.policy[count.index].json
}
