data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.medium"
  availability_zone = "us-west-2a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}
output price {
  value = data.aws_ec2_spot_price.example.spot_price
}
