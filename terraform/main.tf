# main.tf — EC2 instance definition
# TODO: fill in your region, AMI, instance type, key pair, and security groups

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}

output "public_ip" {
  value = aws_instance.main.public_ip
}
