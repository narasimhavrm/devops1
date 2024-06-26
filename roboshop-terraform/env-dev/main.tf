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

tags = {
  company_name = "ABC Company"
  business = "ecomm"
  business_unit = "APAC"
  cost_center = "322"
  project_name = "myproject"
}

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    web_subnet_cidr_block = ["10.0.0.0/24"]
  }
}