terraform {
  required_version = ">=0.12"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0f8ca728008ff5af4"
    instance_type = var.instance-type
    key_name= "aws_key"
 #   vpc_security_group_ids = [aws_security_group.main.id]



user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-1 at instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF

}
/*resource "aws_security_group" "main" {
  name        = "ec2-webserver-sg-1"
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
*/
 resource "aws_key_pair" "deployer" {
    key_name = "aws_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWDqOipGic9r+1hxMEbxxIz57qyRDYGiT/r2EN/VRv7wfWVGSxogkmrKDfops6qOXpKUsb1V5j807TOFhaTF6cUxYa7Ky4laddiR4jfiqwHyViThxjUY2NH5ndDZaZM3UYf8ff4AougT87p5rXeIYlsfiHYfRm+KLh4XMoLqLEy379topck0Il1wlZZrPvA+tC6bXnnCcZyEZJ3e0bVsgpF0aPFI/DSxL3I6X/CoykGeO17hQmSeHMO5K5rV9FP075DwiauwrEL7Auijb1DyC0JiRGKjQFLLJfI4hOzZovrScdT2uXfO8E4mLAypp7H9oI+REEuxIQgTPmQb80WE1b anjum@master"
  }

  output "public_ip_ec2" {
    value = aws_instance.ec2_example.public_ip
    description = "public IP address of Ec2 instance"
    
  }
