#how to assign credentials to terraform (multiple ways to configure credentials)
1.using directly provider details in main .tf

provider "aws" {
  region     = 
  access_key = 
  secret_key = 
}
