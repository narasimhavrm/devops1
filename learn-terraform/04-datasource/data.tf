data "aws_ec2_spot_price" "example" {
  instance_type     = "t3.small"
  availability_zone = "us-east-1a"

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

data "aws_security_group" "selected" {
  name = "allow-all"
}

output security_group_id {
  value = data.aws_security_group.selected.id
}