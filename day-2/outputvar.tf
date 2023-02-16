#Output Variable – These are the Variables that are returned after some execution of modules are resources.
Output Variables are like returned variables from after execution of the module. Output variable can be declared as “output“
  
  # Output variables

output "ec2_instance_id" {
  value = instance.ec2.id
}
  
  
  So, the above snippet will have the block called “output” and the name of the variable is “ec2_instance_id” and this will get the value of executed module. For this case, after the EC2instance creation, it will return the ID of the created EC2 instance and that can be used further to configure the particular created EC2 instance.

