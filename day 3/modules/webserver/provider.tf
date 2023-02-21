#ec2 instances creation
resource "aws_instance" "ec2-machine-1" {

  ami           = var.image-id
  instance_type = var.instance-type

}
