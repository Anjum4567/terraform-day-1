#creating and using modules 
#use case :/modules/webserver/provider.txt details and under working directory /day3/main.tf so trying to create the ec2 instance by mentioning the modules


module "mywebserver" {
  source = "./modules/webserver"
  
}
