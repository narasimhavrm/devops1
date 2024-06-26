env = "prod"

components =  {

  frontend  = {}
  mongodb   = {}
  catalogue = {}
  redis     = {}
  user      = {}
  cart      = {}
  mysql     = {}
  shipping  = {}
  rabbitmq  = {}
  payment   = {}

}

vpc = {
  main = {
    cidr_block = "10.20.0.0/16"
  }