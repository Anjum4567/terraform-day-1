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
  
