resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"

}


  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.web.public_ip
    }
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -U https://github.com/raghudevopsb73/roboshop-ansible main.yml -e env=dev -e role_name=frontend",
    ]
  }