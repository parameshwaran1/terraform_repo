terraform{
   required_providers{
       aws = {
         source = "hashicorp/aws"
         version = "~> 4.0"
       }
   }    
}
provider "aws" {
   region = "ap-south-1"
}

data "aws_ami" "MohakAMIData"{
   most_recent = true 
   owners = ["amazon"]
   filter{
     name = "name"
     values = ["amzn2-ami-hvm*"]
   }
}
locals {
  instanceType = "t2.micro"
}
variable "ec2Name" {
   default = "Terraform"
  
}
resource aws_instance  "MohakEC2Instance"{
     ami = data.aws_ami.MohakAMIData.id
     instance_type = local.instanceType
     tags = {
        "Name" = var.ec2Name
        "Environment" = "Development"
     }
}

output "MohakEC2InstanceId"{
   value =  aws_instance.MohakEC2Instance.id
}