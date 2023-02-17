#1. Create a tf file that will fetch any existing resource data(like sg,vpc,ami etc) and use it  to create instance

provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}






data "aws_ami" "example" {
  owners           = ["801119661308"]

  filter {
    name   = "name"
    values = ["Windows_Server-2022-Turkish-Full-Base-2023.02.15"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
output "ami_id" {
    value = data.aws_ami.example.id  #fechted the ami id 
  
}

#creating ec2 instance from exixting data
resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"  #name of the ec2 machine  
  }
}
