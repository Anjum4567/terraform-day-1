terraform plan

The terraform plan command is used to create an execution plan.
It will not modify things in infrastructure.Terraform performs a refresh, unless explicitly disabled, and then determines what actions are
necessary to achieve the desired state specified in the configuration files.
This command is a convenient way to check whether the execution plan for a set of changes matches your expectations without making any changes to real resources or to the state.

    terraform plan Creates an execution plan (dry run)
    terraform plan -out=path save generated plan output as a file
    terraform plan -destroy Outputs a destroy plan

