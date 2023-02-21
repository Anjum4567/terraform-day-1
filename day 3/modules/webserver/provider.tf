#ec2 instances creation
resource "aws_instance" "ec2-machine-1" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"

}
