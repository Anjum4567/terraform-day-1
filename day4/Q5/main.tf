# Terraform migration - Migrated remote terraform state file to local


terraform {
#   backend "s3" {
#     bucket = "test-s3-bucket-assignment5"
#     key    = "path/terraform.tfstate"
#     region = "ap-south-1"
#   }
}
provider "aws" {
  region = "ap-south-1"
}


# To a create a instance
resource "aws_instance" "ec2_example" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  count         = 2

}


# To migrate the state
# terraform init
# terraform init -migrate-state
