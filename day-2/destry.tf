The terraform destroy command is used to destroy the terraform-managed infrastructure. Terraform destroy command is not the only command through which infrastructure can be destroyed.You can remove the resource block from the configuration and run terraform apply this way you
can destroy the infrastructure.

    terraform destroy –auto-approve : Destroy/cleanup without being prompted to enter ”yes”
    terraform destroy -target : Only destroy the targeted resource and its dependencies
