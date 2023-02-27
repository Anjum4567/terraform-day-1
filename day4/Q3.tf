terraform {
terraform "s3" {
    bucket= "my-bucket-1tf"
    region = "us-east-1"
    key= "terraform.tfstate"
    }
}


provider "aws" {
    access_key = 
    secret_key = 
   region =
   version= "1.1.0"
}
resource "aws_instance" "foo" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  region = "ap-south-1"
}
