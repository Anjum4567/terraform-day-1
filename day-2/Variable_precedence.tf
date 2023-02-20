#1.terraform.tfvars File
#A "terraform.tfvars" file is an alternative to using the "-var" flag or environment variables. The file defines the variable values used by the script. If the file is named "terraform.tvars" it is loaded by default. It's important these files don't get checked into source control, or you are potentially exposing sensitive data.

#main.tf
variable "my_variable" {
  type    = string
  default = "default-value"
}

output "my_variable_output" {
  value = var.my_variable
}

#terrafrom.tfvars
my_variable="apple"


#2.*.tfvars Files
#In some cases you will need multiple variable files. For example, you may wish to keep basic authentication details separate to your variables for building resources. A ".tfvars" file doesn't have to be named "terraform.tfvars", but files named differently will not be loaded by defaul
#main.tf
variable "my_variable" {
  type    = string
  default = "default-value"
}

output "my_variable_output" {
  value = var.my_variable
}

#my.tfvars
my_variable="orange"

o/p:Changes to Outputs:
  + my_variable_output = "banana"


#Notice this has used the environment variable setting. The "my.tfvars" file was ignored. To use a file that is not named "terrform.tfvars", we have to explicitly tell terraform to use the file using the "-var-file" flag. This gives us the expected output.
#terraform plan -var-file="my.tfvars"
#To apply multiple variable files, we need multiple "-var-file" flags, as shown in the example below.
terraform plan -var-file="my.tfvars" -var-file="provider.tfvars"


#3.*.auto.tfvars Files
#An alternative to using the "-var-file" flag is to use a file name with the ".auto.tfvars" extension. This will be loaded automatically, similar to the "terraform.tfvars" file.
#main.tf
variable "my_variable" {
  type    = string
  default = "default-value"
}

output "my_variable_output" {
  value = var.my_variable
}

#my.auto.tfvars
my_variable="grape"

o/pChanges to Outputs:
  + my_variable_output = "grape"


#Search/Priority Order
#A variable value can be defined in multiple ways, but there is a priority associated with them. It's worth combining the above examples and trying them out for yourself. The search or priority order is as follows.

   1. A variable value file explicitly referenced using a "-var" flag.
   2. A ".tfvars" file explicitly referenced using a "-var-file" flag.
   3. A file with the ".auto.tfvars" extension.
   4. A file called "terraform.tfvars".
   5. An environment variable with the "TF_VAR_name" format.
   6. The default value in the variable definition.
#In most cases I use files with the ".auto.tfvars" extension, as I find this the most convenient.

