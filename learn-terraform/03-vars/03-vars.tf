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

## variable types
## plain, list, map

variable "training" {
  default = "DevOps"
}

variable "courses" {
  default =[
  "DevOps",
    "OPS",
    "AWS"
  ]
}

variable "Course_detail" {
  default = {
    "DevOps" = {
      Course = "Devops"
      time = "08AM"
    }
    "AWS" = {
      Course = "AWS"
      Time = "10AM"

    }
  }

}

output train {
  value = var.training
}
output course123 {
  value = var.courses
}
output details {
  value = var.Course_detail
}