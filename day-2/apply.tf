terraform apply

The terraform apply command is used to apply the changes required to reach the desired state of the configuration. Terraform apply will also write data to the terraform.tfstate file.
Once the application is completed, resources are immediately available.

    terraform apply’ : Executes changes to the actual environment
    terraform apply –auto-approve : Apply changes without being prompted to enter ”yes”
    terraform apply -refresh=true : Update the state for each resource prior to planning and applying
    terraform apply -input=false : Ask for input for variables if not directly set
    terraform apply -var ‘foo=bar’ : Set a variable in the Terraform configuration, can be used multiple times
    terraform apply -var-file=foo : Specify a file that contains key/value pairs for variable values
    terraform apply -target : Only apply/deploy changes to the targeted resource
