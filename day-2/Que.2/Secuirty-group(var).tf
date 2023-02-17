#variable.tf
variable "ports" {
  type = list(number)
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}


#values.tf
ports         = [22, 80, 443, 3306, 27017, 1080]
image_id      = "ami-0f8ca728008ff5af4"
instance_type = "t2.micro"
access_key    = "
secret_key    = 


#main.tf
# creating securing group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}
