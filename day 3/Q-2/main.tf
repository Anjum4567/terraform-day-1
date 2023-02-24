provider "aws" {
    access_key =   
    secret_key  = 
  region = "ap-south-1"

}

module "mymodule1" {
  source = ".//module"
}
