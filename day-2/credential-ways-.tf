#how to assign credentials to terraform (multiple ways to configure credentials)
1.using directly provider details in main .tf

provider "aws" {
  region     = 
  access_key = 
  secret_key = 
}


2.by creating var.tf then use env varaible to access those details
  
------>var.tf
variable access_key {
    type = string
    default = "acces key......................."
    description = "for aws account 1"

  
}
variable secret_key {
    type = string
    default = "secret key ....................................."
    description = "for aws secret key "
  
}
 
 ----->main.tf
  provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

3.with profile option

  aws configure --profile terraform-user
  
  
  provider "aws"{
    profile = "terraform-user"
    region ="= "ap-south-1"
    
  }
  
 4.with export
 
 export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"

5.with IAM role 
provider "aws"{
assume_role {
role_arn = "arn:aws:iaw::648734734763:role/lamdaralcc2"
seesion_name = "default"
}
}
