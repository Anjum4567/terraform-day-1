resource "aws_instance" "ec2_example3" {
  ami                    = "ami-0f8ca728008ff5af4"
  instance_type          = "t2.micro"
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "Assgn3.2_Module EC2"
  }

  # Remote-exec Provisioner running bash script on remote machine
  provisioner "remote-exec" {
    script = "./testing.sh"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("/home/anjum/Documents/keys/aws_key")
    timeout     = "4m"
  }

}

# creating security group
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

# creating key pair
resource "aws_key_pair" "deployer-1" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWDqOipGic9r+1hxMEbxxIz57qyRDYGiT/r2EN/VRv7wfWVGSxogkmrKDfops6qOXpKUsb1V5j807TOFhaTF6cUxYa7Ky4laddiR4jfiqwHyViThxjUY2NH5ndDZaZM3UYf8ff4AougT87p5rXeIYlsfiHYfRm+KLh4XMoLqLEy379topck0Il1wlZZrPvA+tC6bXnnCcZyEZJ3e0bVsgpF0aPFI/DSxL3I6X/CoykGeO17hQmSeHMO5K5rV9FP075DwiauwrEL7Auijb1DyC0JiRGKjQFLLJfI4hOzZovrScdT2uXfO8E4mLAypp7H9oI+REEuxIQgTPmQb80WE1b anjum@master"
}
