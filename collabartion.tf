terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}
locals {
  arr = ["hello","World"]
}

output "mohakOut" {
   value = local.arr
}