variable "component" {}
variable "env" {}
variable "tags" {}
variable "subnet_ids" {}
variable "sg_subnet_cidr" {}
variable "kms_key_arn" {}
variable "engine_version" {}
variable "engine" {}
variable "port" {
  default = 27017
}
variable "vpc_id" {}
variable "instance_class" {}
variable "db_instance_count" {}
