module "vpc" {
  source = "git::https://github.com/narasimhavrm/devops1.git//tf-module-vpc"
  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
  env = var.env
  tags = var.tags
  ###web_subnet_cidr_block = each.value["web_subnet_cidr_block"]
  subnets = each.value["subnets"]
  default_vpc_id = var.default_vpc_id

}

module "app_server" {
  source = "git::https://github.com/narasimhavrm/devops1.git//tf-module-app"
  env = var.env
  tags = var.tags
  component = "test"
  subnet_id = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "app", null), "subnet_ids", null)[0]
  vpc_id = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
}






# module "instances" {
#   for_each = var.components
#   source   = "git::https://github.com/narasimhavrm/devops1.git//tf-module-app"
#   component     = each.key
#   env = var.env
#   tags = merge(each.value["tags"], var.tags)
# }

# module "test" {
#   source = "git::https://github.com/narasimhavrm/devops1.git//tf-module-app"
#   env = var.env
# }