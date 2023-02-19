#created ec2 machine then s3  bucket where in( the image id is the name of the s3 backet)


data "aws_instance" "myawsinstance" {
  filter {
    name   = "tag:Name"
    values = ["Terraform EC2"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [
    aws_instance.ec2_example
  ]
}


resource "aws_instance" "ec2_example" {

  ami           = "ami-0f8ca728008ff5af4"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.MYpublic_subnet.id}"

  tags = {
    Name = "Terraform EC2"
  }

}
output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance.id
}

 
   

 


resource "aws_s3_bucket" "s3_bucket" {
  bucket = data.aws_instance.myawsinstance.id #name of the bucket 
   

  tags = {
    Name = "My bucket"
    
  }
}

