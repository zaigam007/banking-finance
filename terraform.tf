terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
region = "eu-north-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_instance" "First-Terraform-Instance"{
ami = "ami-0989fb15ce71ba39e"
instance_type = "t3.micro"
key_name = "Stockholmpem"
tags = {
        Name = "Test-server"
}


}
output "instance_ip" {
  value = aws_instance.First-Terraform-Instance.public_ip
}

resource "local_file" "instance_ip_file" {
  filename = "instance_ip.txt"
  content  = aws_instance.First-Terraform-Instance.public_ip
}
