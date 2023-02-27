# Import existing infrastructure for aws_instance and s3 bucket

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {

}

# To import infrastructure : terraform import aws_instance.ec2_example i-01cc4ddcfeddba8bc
# To check state file output (To create resource from imported insfrastructure): terraform show

# Create resource from imported insfrastructure
#resource "aws_instance" "ec2_example" {
#  ami                                  = "ami-0f8ca728008ff5af4"
#  instance_type                        = "t2.micro"
#  tags = {
#    "Name" = "my-test-ec2"
#  }
#}

resource "aws_s3_bucket" "my_test_bucket" {
 
  }
# #terraform import aws_s3_bucket.my_test_bucket test-bucket-1-for-import
# resource "aws_s3_bucket" "my_test_bucket" {
#   bucket = "test-bucket-1-for-import"
#   tags = {
#     "name" = "test-bucket"
#   }
# }
