# variables.tf — fill these in or pass via terraform.tfvars

variable "aws_region"         { default = "eu-west-1" }
variable "ami_id"             { default = "ami-XXXXXXXX" }   # e.g. Ubuntu 24.04 LTS
variable "instance_type"      { default = "t2.micro" }       # free tier eligible
variable "key_name"           { default = "my-key-pair" }
variable "instance_name"      { default = "ec2-revival-kit" }
variable "security_group_ids" { default = [] }
variable "subnet_id"          { default = "" }
