Syntax

Let’s learn how to write Terraform code. Terraform consists of only a few basic elements.
  
  <BLOCK TYPE> “<BLOCK LABEL>” “<BLOCK LABEL>” {
# Block body
<IDENTIFIER> = <EXPRESSION> # Argument
}

There are several Block types like “resource”, “variable”, “output” and so on. You can use them according to your need. Block labels vary by cloud platforms. The other Block Label is used to name the resource. It can be defined by the user. Identifiers may vary by resource. The user can assign values to the identifiers. You can go through the following example.
resource "azurerm_resource_group" "main" 
{  
  name     = "test-resource-group" 
  location = "centralus"  
  tags = {    
    environment = "dev"    
    source = "terraform"  
  }
  
}

This is an example for configure a resource group for Azure.
 RUN
  
  
  Now you can test your terraform code. First, we have to initialize our working directory containing Terraform configuration files. For that we can use the terraform init Command. After a few seconds you can see the “.terraform.lock.hcl” file with a success message.
    Then you can hit the terraform plan Command to determine the desired state of all the resources it declares. If there are any errors you can see them in the terminal with line numbers. Else you can see how many resources that you added in the terminal.
    After all these configurations now you can deploy your first cloud resource in your favorite cloud platform using the terraform apply Command.
