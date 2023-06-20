module "this" {
  source      = "../../naming_convention"
  environment = var.environment
  project     = var.project
  region      = var.region
  company     = var.company
}