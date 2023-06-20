output "custom_context" {
  value       = module.custom.context
  description = "Custom context for naming based on inputs passed. Context with variables from the `cloudposse/label/null` module. Does not consider services."
}

output "company_context" {
  value       = local.company_context
  description = "Custom context for naming based on inputs passed. Context with standard Company variables: `region` `component_name` `environment`. Does not consider services."
}

output "custom_context_id" {
  value       = module.custom.id
  description = "Custom context ID string for naming based on inputs passed. Does not consider services."
}