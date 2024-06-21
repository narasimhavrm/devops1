module "instances" {
  for_each = var.components
  source   = "git::https://github.com/narasimhavrm/devops1.git//tf-module-app"
  component     = each.key
  env = var.env
}

# module "test" {
#   source = "git::https://github.com/narasimhavrm/devops1.git//tf-module-app"
#   env = var.env
# }