resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-002625eba7df10194"]

  tags = {
    Name = "HelloWorld"
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
        "ansible-pull -i localhost, -e ansible_user=centos -e ansible_password=DevOps321 -U https://github.com/raghudevopsb73/roboshop-ansible main.yml -e env=dev -e role_name=frontend",
      ]
    }
}


data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"

}



