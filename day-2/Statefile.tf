This article contains the overview of terraform state file and how to configure the Backends to store the tfstate file.
 1.When we build infrastructure with terraform configuration
2. a state file gets created in the local workspace directory named “terraform.tfstate”.
3.This state file contains information about the provisioned infrastructure which terraform manage
4.Whenever we change the configuration file, it automatically determines which part of your configuration is already created and which needs to be changed with help of state file.
#What is TFSTATE ?
-Terraform must store state about your managed infrastructure and configuration.
-This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.
-This state is stored by default in a local file named “terraform.tfstate”, but it can also be stored remotely, which works better in a team environment.
#What is terraform refresh ?
-Prior to any operation, Terraform does a refresh to update the state with the real infrastructure.
-The terraform refresh command is used to update the tfstate file.
-This can be used to detect any drift from the last-known state, and to update the state file.
-This does not modify infrastructure, but does modify the state file. If the state is changed, this may cause changes to occur during the next plan or apply.
  
  
 Purpose of Terraform State?
 1.Every time you run Terraform, it records information about what infrastructure it created in a Terraform state file. This file is in JSON format & have mapping from terraform resources.
2.Here I have created a simple terraform file which will create an EC2 instance.
3.Let’s run terraform init & terraform apply & check our directory. So after running terraform apply, we can see one more file in our directory i.e terraform.tfstate
4.When we open that file, we see a long JSON format containing data. Now we go a little back & I had asked how terraform knows that which resource it needs to create/update?
5.So Using this JSON format, Terraform knows that a resource with type aws_instance and name “test” corresponds to an EC2 Instance Every time you run Terraform,
6.it can fetch the latest status of this EC2 Instance from AWS and compare that to what’s in your Terraform configurations to determine what changes need to be applied
7.NOte:When running a terraform plan, Terraform must know the current state of resources in order to effectively determine the changes that it needs to make to reach your desired configuration.
8.Terraform stores state locally in a file named terraform.tfstate. When working with Terraform in a team, use of a local file makes Terraform usage complicated because each user must make sure they always have the latest state data before running Terraform and make sure that nobody else runs Terraform at the same time.
With remote state, Terraform writes the state data to a remote data store, which can then be shared between all members of a team. Terraform supports storing state in Terraform Enterprise, HashiCorp Consul, Amazon S3, and more.

  
 
 
 How to maintain “.tfstate” file ?
 Using S3 Backend:
 1.Maintain the “.tfstate” file on S3 by using the Backend option.

