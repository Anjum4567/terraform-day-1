#cloud provider details
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "ap-south-1"
}

#data source for availability zones
data "aws_availability_zones" "region_availability_zones"{
  state = "available"
}

#load child vpc-module
module "vpc_with_tf_registry" {
source =".//vpc"  

az1 = data.aws_availability_zones.region_availability_zones.names[0]
az2=data.aws_availability_zones.region_availability_zones.names[1]
}
