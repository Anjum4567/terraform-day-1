provider "aws" {
  region = var.web_region
  access_key = var.access_key
  secret_key = var.secret_key
  
}

module "this-is-module-1" {
    source = ".//module-1"

    instance-type = "t2.micro"
  
}



module "this-is-module-2" {
    source = ".//module-2"
  
}
