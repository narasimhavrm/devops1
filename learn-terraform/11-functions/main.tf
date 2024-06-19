variable "class" {
  default = "DevOps"
}

output "class" {
  value = upper(var.class)
}

variable fruits {
  default = ["mango", "orange", "avacado", "apple"]
}

output "countOfFruits" {
  value = length(var.fruits)
}