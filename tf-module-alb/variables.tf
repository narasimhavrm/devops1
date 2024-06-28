variable "name" {}
variable "internal" {}
variable "load_balancer_type" {}
variable "env" {}
variable "vpc_id" {}
variable "port" {
  default = 80
}
variable "subnets" {}
variable "tags" {}
variable "sg_subnet_cidr" {}


