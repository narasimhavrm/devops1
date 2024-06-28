resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.component}-${var.env}"
  subnet_ids = var.subnet_ids

  tags = merge({ Name = "${var.component}-${var.env}" }, var.tags )
}

# resource "aws_elasticache_cluster" "example" {
#   cluster_id           = "${var.component}-${var.env}"
#   engine               = var.engine
#   node_type            = var.node_type
#   num_cache_nodes      = var.num_cache_nodes
#   engine_version       = var.engine_version
#   port                 = var.port
# }
