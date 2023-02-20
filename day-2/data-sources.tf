Data Source
1.data sources can be used to feed the  Terraform configuration with the set of data from outside the Terraform or from other Terraform Configuration files. 
2.These data source block can be defined as “data” and followed by braces “{ ... }“.
# Data source

data "aws_ami" "server_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["server-*"]
  }
}

#resorce that is using data source.

resource "aws_instance" "server" {
  ami           = "${data.aws_ami.server_ami.id}"
  instance_type = "t2.nano"
}
3.which will get AWS AMI from the repository or somewhere where the AMIs are listed and prefixed with “server-“. Then the same data source can be used by the resource mentioned in the snippet as “data.aws_ami.server_ami.id“.
