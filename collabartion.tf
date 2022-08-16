terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
  
}
locals {
  arr = ["hello","World"]
}

data "aws_ami" "MohakAMIData" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name ="name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "MohakEC2Instance" {
  ami = data.aws_ami.MohakAMIData.id
  instance_type = "t2.micro"
}

output "mohakOut" {
   value = local.arr
}