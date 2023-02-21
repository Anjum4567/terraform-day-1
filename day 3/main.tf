variable "access_key" {
  type        = string
  default     = ""
  description = "for aws account 1"


}
variable "secret_key" {
  type        = string
  default     = ""
  description = "for aws secret key "

}

provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


#ec2 instances creation
resource "aws_instance" "ec2-machine-1" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  key_name = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

#file provisioner
provisioner "file" {
    source = "/home/anjum/Videos/Terraform/day3/test-file.txt"
    destination = "/home/ubuntu/test-file.txt"

}

 # Local-exec provisioner

  provisioner "local-exec" {
    #command = "touch hello-local-exec-provisioner.txt"
    # Output of instance ip
    command = "echo ${aws_instance.ec2_example.private_ip} >> private_ips.txt"
  }

   # Remote-exec Provisioner 
  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  # To copy files securely
connection{
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key =file("/home/anjum/Documents/keys/aws_key")
    timeout ="4m"
}
}




resource "aws_security_group" "main" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  #dynamic block 
  dynamic "ingress" {
    for_each = [22, 80, 443, 3306, 27017]
    iterator = port #it shows the value of temp variable 
    content  {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]


    }
  }
}
  resource "aws_key_pair" "deployer" {
    key_name = "aws_key"
    public_key = "AQDWDqOipGic9r+1hxMEbxxIogkmrKDfops6qOXpKUsb1V5j807T
    }
