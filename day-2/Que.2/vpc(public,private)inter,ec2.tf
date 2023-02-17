#creating vpc , name , cidr ,tags
resource "aws_vpc" "MYVPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "MYVPC"
  }
}

#creating public subnet in vpc
resource "aws_subnet" "MYpublic_subnet" {
  vpc_id     = aws_vpc.MYVPC.id #interpolution in aws it is used to refer the string, var to call a function
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true" #

  tags = {
    Name = "MYpublic_subnet"
  }
}

/*#creating private subnet in vpc
resource "aws_subnet" "MYprivate_subnet" {
  vpc_id     = aws_vpc.MYVPC.id #interpolution in aws it is used to refer the string, var to call a function
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "false" #

  tags = {
    Name = "MYprivate_subnet"
  }
}*/

#creating internet gateway in aws  VPC
resource "aws_internet_gateway" "My_internetgateway" {
  vpc_id = aws_vpc.MYVPC.id

  tags = {
    Name = "MYVPC"
  }
}

#creating route table for internet gateway
resource "aws_route_table" "myroute-table" {
  vpc_id = aws_vpc.MYVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My_internetgateway.id
  }
  tags = {
    Name = "MYprivate_subnet"
  }
}


#creating Route Association public subnets 
resource "aws_route_table_association" "associate" {
  subnet_id      = aws_subnet.MYpublic_subnet.id
  route_table_id = aws_route_table.myroute-table.id
}

#creating Ec2 instance in public subnets
resource "aws_instance" "public_instance" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.MYpublic_subnet.id}"
  tags = {
    Name = "public_instance"
  }
}



#creating s3 bucket
variable "bucket_name" {
  description = "name of the bucket"
 type= string
  default= "s3-bucket-is-name"
}
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name #name of the bucket 
   acl    = "private"

  tags = {
    Name = "My bucket"
    
  }
}

