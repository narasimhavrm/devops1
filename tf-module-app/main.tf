# # security group
resource "aws_security_group" "main" {
  name        = "${var.component}-${var.env}-sg"
  description = "${var.component}-${var.env}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "-1"
    cidr_blocks = var.sg_subnets_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}

resource "aws_launch_template" "main" {
  name = "${var.component}-${var.env}"

  iam_instance_profile {
    name = aws_iam_instance_profile.instance_profile.name
  }
  image_id = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id ]

  tag_specifications {
    resource_type = "instance"
    tags = merge({ Name = "${var.component}-${var.env}", monitor = "true" }, var.tags )
  }

  user_data = templatefile("${path.module}/userdata.sh", {
    env =var.env
    component = var.component

  })
  root_block_device = {
    encrypted = true
    kms_key_id = var.kms_key_id
  }
}

resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "main" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
}



















# resource "aws_instance" "test" {
#   ami = data.aws_ami.ami.id
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.sg.id]
#   subnet_id = var.subnet_id
#
#   tags = {
#     Name = var.component
#   }
# }

#
# # security group
# resource "aws_security_group" "sg" {

#   name        = "${var.component}-${var.env}-sg"
#   description = "${var.component}-${var.env}-sg"
#
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   tags = {
#     Name = "${var.component}-${var.env}-sg"
#   }
# }
# #DNS record
# resource "aws_route53_record" "dns" {
#   zone_id = "Z034092834K6LW0HQ9HDN"
#   name    = "${var.component}-dev"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.instance.private_ip]
# }
# #EC2 instance
# resource "aws_instance" "instance" {
#   ami                    = data.aws_ami.ami.id
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.sg.id]
#   iam_instance_profile = aws_iam_instance_profile.instance_profile.name
#
#   tags = merge({
#     Name = "${var.component}-${var.env}"
#   }, var.tags )
# }
#
# resource "null_resource" "ansible" {
#   depends_on = [aws_instance.instance, aws_route53_record.dns]
#   provisioner "remote-exec" {
#
#     connection {
#       type     = "ssh"
#       user     = "centos"
#       password = "DevOps321"
#       host     = aws_instance.instance.public_ip
#     }
#
#     inline = [
#       "sudo labauto ansible",
#       "sudo set-hostname -skip-apply ${var.component}",
#       "ansible-pull -i localhost, -U https://github.com/narasimhavrm/devops1.git roboshop-ansible/main.yml -e env=${var.env} -e role_name=${var.component}"
#     ]
#   }
# }


# resource "null_resource" "test" {
#   triggers = {
#     xyz = timestamp()
#   }
#   provisioner "local-exec" {
#     command = "echo Hello World - Env is ${var.env}"
#   }
# }

