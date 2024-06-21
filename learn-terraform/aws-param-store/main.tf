resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
}

variable "params" {
  default = [
    {name = "roboshop.dev.frontend.catalogue", value = "http://catalogue-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.user", value = "http://user-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.cart", value = "http://cart-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.payment", value = "http://payment-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.shipping", value = "http://shipping-dev.mystorymyway.online", type = "String"},
  ]

}

# variable "params" {
#   default = [
#     {name = "demo1", value = "demo1", type = "String"},
#     {name = "demo2", value = "demo2", type = "String"}
#   ]
#
# }