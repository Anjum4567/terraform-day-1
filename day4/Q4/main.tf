# Terraform workspaces.

provider "aws" {
  region = "ap-south-1"
}

locals {
  instance_name = "${terraform.workspace}-instance" 
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0f8ca728008ff5af4" 

    instance_type = "t2.micro"

    tags = {
      Name = local.instance_name
    }
}




# command to see terraform workspaces = terraform workspace list
# Command to create new workspace = terraform workspace new name_of_workspace
# Command to show active running workspace = terraform workspace show
# Command to switch workspace = terraform workspace select workspace_name
# ${terraform.workspace} = gives terraform workspace name
