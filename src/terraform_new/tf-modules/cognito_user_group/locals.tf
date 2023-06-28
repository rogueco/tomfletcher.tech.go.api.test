locals {
  name        = "${module.this.custom_context_id}.${var.name}"
  name_role   = "${module.this.custom_context_id}.role.${var.name}"
  name_policy = "${module.this.custom_context_id}.policy.${var.name}"
}
