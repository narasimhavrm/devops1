data "aws_ami" "ami" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"

}

resource "aws_instance" "load-runner" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.medium"
  vpc_security_group_ids = ["sg-002625eba7df10194"]
  tags = {
    Name = "load-runner"
  }

  provisioner "local-exec" {
    connection {
      user = "root"
      password = "DevOps321"
      host = self.public_ip

    }
    inline = [
      "labauto docker",
      "docker pull robotshop/rs-load:latest"
    ]
  }
}

