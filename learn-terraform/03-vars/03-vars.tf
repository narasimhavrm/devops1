variable "sample" {
  default = 100
}
variable "Sample1" {
  default = "Hello World"
}

output sample {
  value = var.sample
}

output sample1 {
  value = var.Sample1
}

##Sometime if variable/any reference with any other string then we have to access those in ${}

output sample-extended {
  value = "Sample extended value is ${var.sample}"
}