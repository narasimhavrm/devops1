env = "dev"

components =  {

  frontend  = {
    tags = { monitor = "true", env = "dev"}
  }
  mongodb   = {
    tags = { env = "dev"}
  }
  catalogue = {
    tags = { monitor = "true", env = "dev"}
  }
  redis     = {
    tags = {  env = "dev"}
  }
  user      = {
    tags = { monitor = "true", env = "dev"}
  }
  cart      = {
    tags = { monitor = "true", env = "dev"}
  }
  mysql     = {
    tags = { env = "dev"}
  }
  shipping  = {
    tags = { monitor = "true", env = "dev"}
  }
  rabbitmq  = {
    tags = { env = "dev"}
  }
  payment   = {
    tags = { monitor = "true", env = "dev"}
  }

}