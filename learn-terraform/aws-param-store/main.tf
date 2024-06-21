resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
}

variable "params" {
  default = [
    {name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.user_url", value = "http://user-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.mystorymyway.online", type = "String"},
  ]

}

# variable "params" {
#   default = [
#     {name = "demo1", value = "demo1", type = "String"},
#     {name = "demo2", value = "demo2", type = "String"}
#   ]
#
# }