variable "class" {
  default = "DevOps"
}

output "class" {
  value = upper(var.class)
}