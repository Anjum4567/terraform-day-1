provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "foo" {

  ami           = "ami-0f8ca728008ff5af4
  instance_type = "t2.micro"
}

