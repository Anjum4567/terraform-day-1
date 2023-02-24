#declare the output variable to see the deatils of resources 
output "vpc_id" {
    description = "VPC ID"
    value = module.vpc.vpc_id 
    
  
}
