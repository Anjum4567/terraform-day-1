# Theory-of-variables.tf
Terraform Variables: Terraform Variable Types 

Terraform Input Variables
Terraform input variables are used as parameters to input values at run time to customize our deployments. Input terraform variables can be defined in the main.tf configuration file but it is a best practice to define them in a separate variable.tf file to provide better readability and organization.
A variable is defined by using a variable block with a label. The label is the name of the variable and must be unique among all the variables in the same configuration.

variables.tf file
variable "resoirceGroupName" {
  type =string
  description ="name of resource group"
  
}
variable "location"{
  type =string
  description ="location of your resoiurce group"
}
The variable declaration can optionally include three arguments:

    .description: briefly explain the purpose of the variable and what kind of value is expected.
    .type: specifies the type of value such as string, number, bool, map, list, etc.
    .default: If present, the variable is considered to be optional and if no value is set, the default value is used.
  Terraform Input Variables
The type argument in a variable block allows you to enforce type constraints on the variables a user passes in. Terraform supports a number of types, including string, number, bool, list, map, set, object, tuple, and any.

If a type isn’t specified, then Terraform assumes the type is any. Now, let’s have a look at some of these terraform variables types and their classification.
Primitive Types

A primitive type is a simple type that isn’t made from any other type. The available primitive types are:

    string: a sequence of characters representing some text, such as “hello”.
    number: a numeric value. The number type can represent both whole numbers like 15 and fractional values such as 6.28318.
    bool: either true or false.
    
Complex Types
A complex type is a type that groups multiple values into a single value. These values could be of a similar type or different types.
1.1.List: A Terraform list variable is a sequence of similar values indexed by numbers (starting with 0). It accepts any type of value as long as they are all of the same types. Lists can be defined either implicitly or explicitly.
list variable define
  
variable users {
    type = list
  
}
output printfirst {
    value = "first user is ${var.users[1]}"  #   + printfirst = "first user is gaurav"

}
2.maps

We've replaced our sensitive strings with variables, but we still are hard-coding AMIs. Unfortunately, AMIs are specific to the region that is in use.

Maps are a way to create variables that are lookup tables. Let's extract our AMIs into a map and add support for the us-west-1 region as well. Here is our updated tf file:
  provider "aws" {
	region = "${var.aws_region}"
}

resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = "${file("terraform-demo.pub")}"
}

resource "aws_instance" "my-instance" {
	ami = "${lookup(var.ami,var.aws_region)}"
	instance_type = "${var.instance_type}"
	key_name = "${aws_key_pair.terraform-demo.key_name}"
	user_data = "${file("install_apache.sh")}"
	tags = {
		Name = "Terraform"	
		Batch = "5AM"
	}
}
  
  
  
Out vars.tf:

variable "ami" {
  type    = "map"
  default = {
    "us-east-1" = "ami-04169656fea786776"
    "us-west-1" = "ami-006fce2a9625b177f"
  }
}

variable "instance_type" {
	default = "t2.nano"
}

variable "aws_region" {
	default = "us-east-1"
}
3.    Object: An object is a structural type that can contain different types of values, unlike map, list. It is a collection of named attributes that each have their own type.
    In the below example, we have declared an object type variable os for the os image that can be used to deploy a VM.
    object variable define
   variable "os" {
  description = "os image to deploy"
  type =object({
    publisher = string
    offer = string 
    sku =string
    version =string 
  })
  
}
      
      
#.Using Environment variables

This is a dynamic value that has been set-up on your operating system and it affects how any process on your system works. These are always in pairs. In this case, your system is searched for the environment variables whose name might be in the format as seen below:

 TF_VAR_VARNAME
Below is an example of how you may assign values in this case:
  export TF_VAR_REGION=us-east-one
  export TF_VAR-IMG-ID=ami-67798

#Use Input Variables

After declaration, we can use the variables in our main.tf file by calling that variable in the var.<name> format. The value to the variables is assigned during terraform apply.

    provider "aws" {
  version ="1.38.0"
  
}
#create resource group 
resource "aws_instance" "ec2_example"{
 name = var.aws_instance
 location =var.location
 tags ={
  Environment = "DEV"
 }
  
  
Assign Values To Input Variables

There are multiple ways to assign values to variables. The following is the descending order of precedence in which variables are considered.
1. Command-line flags

The most simple way to assign value to a variable is using the -var option in the command line when running the terraform plan and terraform apply commands.

$ terraform apply -var="resourceGroupName=............" -var="location=eastus"
  

}

 2. Variable Definition (.tfvars) Files

If there are many variable values to input, we can define them in a variable definition file. Terraform also automatically loads a number of variable definitions files if they are present:

    Files named exactly terraform.tfvars or terraform.tfvars.json
    Any files with names ending in .auto.tfvars or .auto.tfvars.json

terraform.tfvars file
  
  resourceGroupName="............" 
  location="eastus"
 If the file is named something else, then use the -var-file flag directly to specify a file.

$ terraform apply -var-file="testing.tfvars"
   
 3. Terraform Environment Variables

Terraform searches the environment of its own process for environment variables named TF_VAR_<var-name> followed by the name of a declared variable. Terraform scans all variables starting with TF_VAR and uses those as variable values for Terraform.

$ export TF_VAR_location=eastus

This can be useful when running Terraform in automation, or when running a sequence of Terraform commands in succession with the same terraform variables.
    
4.Define Output Variables

Outputs allow us to define values in the configuration that we want to share with other resources or modules. For example, we could pass on the output information for the public IP address of a server to another process.

    
  output "public_ip_address" {
  description ="publix IP address of virtual machine"
  value = azurem_public_ip.publicip.ip_address 
}
  
An output variable is defined by using an output block with a label. The label must be unique as it can be used to reference the output’s value. Let’s define an output to show us the public IP address of the server. Add this to any of the *.tf files.
output variableMultiple output blocks can be defined to specify multiple output variables. Outputs are only shown when Terraform applies your plan, running a terraform plan will not render any outputs.

	
	
	
#Statefile Thoery		
	
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
	
	
	

#Resources

The resource block defines a piece of infrastructure. A resource might be a physical component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

The resource block has two strings before the block: the resource type and the resource name. In the example, the resource type is “aws_instance” and the name is “example.” The prefix of the type maps to the provider. In our case “aws_instance” automatically tells Terraform that it is managed by the “aws” provider
	
	
	
#

	
	
