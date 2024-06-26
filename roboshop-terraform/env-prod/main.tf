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
}

tags = {
  company_name = "ABC Company"
  business = "ecomm"
  business_unit = "APAC"
  cost_center = "322"
  project_name = "myproject"
}