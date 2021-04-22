provider "aws" {
  region  = var.region
  profile = "default"
}
##Guardar estado en bucket s3
terraform {
  backend "s3" {
    bucket = "terraform-state-grupo-1"
    key    = "trabajando-terraform.tfstate"
    dynamodb_table = "TerraformCloudLock"
    region = "us-east-1"
  }
}

##Tabla dynamo para bloquear estado
# resource "aws_dynamodb_table" "dynamodb_terraform_cloud_lock" {
#   name           = "TerraformCloudLock"
#   hash_key       = "LockID"
#   billing_mode   = "PAY_PER_REQUEST"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name = "Terraform state lock table for cloud common"
#     App  = "TerraformCloudLock"
#     Service = "TerraformCloudLock"

#   }
# }