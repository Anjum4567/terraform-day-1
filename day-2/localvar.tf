#Local variable – Local variables set values can be used within the modules.

#Local Variables are basically the variables that are made available within the modules and these are mentioned as “locals“.
# Local Variables

locals {
  operation_name = "app-server"
  instance_id = ec2_instance_id
}



So, the above snippet shows the list of local variables called “operation_name” and the “instance_id“. Just note closely that we have connected the output variable name “ec2_instance_id” in the “instance_id” and hence it is going to be a dynamic local variable.
