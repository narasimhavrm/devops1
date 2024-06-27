# #IAM policy
# resource "aws_iam_policy" "policy" {
#   name        = "${var.component}-${var.env}-ssm-pm-policy"
#   path        = "/"
#   description = "${var.component}-${var.env}-ssm-pm-policy"
#
#   policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "VisualEditor0",
#         "Effect": "Allow",
#         "Action": [
#           "ssm:GetParameterHistory",
#           "ssm:GetParametersByPath",
#           "ssm:GetParameters",
#           "ssm:GetParameter"
#         ],
#         "Resource": "arn:aws:ssm:us-east-1:079329262703:parameter/roboshop.${var.env}.${var.component}.*"
#       }
#     ]
#   })
# }
# #IAM role
# resource "aws_iam_role" "role" {
#   name = "${var.component}-${var.env}-ec2-role"
#
#   assume_role_policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Effect": "Allow",
#         "Principal": {
#           "Service": "ec2.amazonaws.com"
#         },
#         "Action": "sts:AssumeRole"
#       }
#     ]
#   })
#
# }
#
# resource "aws_iam_instance_profile" "instance_profile" {
#   name = "${var.component}-${var.env}-ec2-role"
#   role = aws_iam_role.role.name
# }
#
# resource "aws_iam_role_policy_attachment" "policy-attach" {
#   role       = aws_iam_role.role.name
#   policy_arn = aws_iam_policy.policy.arn
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

# # security group
resource "aws_security_group" "sg" {
  name        = "${var.component}-${var.env}-sg"
  description = "${var.component}-${var.env}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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
resource "aws_instance" "test" {
  ami = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = var.subnet_id

  tags = {
    Name = var.component
  }
}