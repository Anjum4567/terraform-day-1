# Remove imported infrastructure

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2_example" {

}

# To import infrastructure : terraform import aws_instance.ec2_example i-01cc4ddcfeddba8bc
# To check state file output (To create resource from imported insfrastructure): terraform show

# Command to show resource_type.name = terraform state list
# To destroy a specific resource = terraform destroy -target resource_type.name
