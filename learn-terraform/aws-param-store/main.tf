resource "aws_ssm_parameter" "params" {
  count = length(var.params)
  name  = var.params[count.index].name
  type  = var.params[count.index].type
  value = var.params[count.index].value
  key_id = "af887b98-0e7c-49a1-93eb-aeaab4189fc3"
  overwrite = true
}

variable "params" {
  default = [
    {name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.mystorymyway.online:8080/", type = "String"},
    {name = "roboshop.dev.frontend.user_url", value = "http://user-dev.mystorymyway.online:8080/", type = "String"},
    {name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.mystorymyway.online:8080/", type = "String"},
    {name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.mystorymyway.online:8080/", type = "String"},
    {name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.mystorymyway.online:8080/", type = "String"},
    {name = "roboshop.dev.cart.redis_host", value = "redis-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.cart.catalogue_port", value = "8080", type = "String"},
    {name = "roboshop.dev.catalogue.mongo", value = "true", type = "String"},
    {name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.mystorymyway.online:27017/catalogue", type = "String"},
    {name = "roboshop.dev.payment.cart_host", value = "cart-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.payment.cart_port", value = "8080", type = "String"},
    {name = "roboshop.dev.payment.user_host", value = "user-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.payment.user_port", value = "8080", type = "String"},
    {name = "roboshop.dev.payment.amqp_host", value = "rabbitmq-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.payment.amqp_user", value = "roboshop", type = "String"},
    {name = "roboshop.dev.shipping.cart_endpoint", value = "cart-dev.mystorymyway.online:8080", type = "String"},
    {name = "roboshop.dev.shipping.db_host", value = "mysql-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.user.mongo", value = "true", type = "String"},
    {name = "roboshop.dev.user.redis_host", value = "redis-dev.mystorymyway.online", type = "String"},
    {name = "roboshop.dev.user.mongo_url", value = "mongodb://mongodb-dev.mystorymyway.online:27017/users", type = "String"},
    {name = "roboshop.dev.rabbitmq.amqp_user", value = "roboshop", type = "String"},
    {name = "roboshop.dev.mysql.username", value = "roboshop", type = "String"},
    {name = "roboshop.dev.docdb.username", value = "roboshop", type = "String"},



    #Passwords will be never part of git repos, Usually in organizations we create them manually,
    # whom ever have access will provision in parameter store
    {name = "roboshop.dev.payment.amqp_pass", value = "roboshop123", type = "SecureString"},
    {name = "roboshop.dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString"},
    {name = "roboshop.dev.mysql.password", value = "roboshop123", type = "SecureString"},
    {name = "roboshop.dev.docdb.password", value = "roboshop123", type = "SecureString"},

  ]

}

# variable "params" {
#   default = [
#     {name = "demo1", value = "demo1", type = "String"},
#     {name = "demo2", value = "demo2", type = "String"}
#   ]
#
# }