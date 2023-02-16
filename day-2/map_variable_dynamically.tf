#How to use map variable Dynamically



variable "usersage" {
    type = map
    default = {
    gaurav =20
    saurav = 30
    }
}

variable "username" {
    type = string
  
}
output  "userage"{
    value = "my name is ${var.username} and age is  ${lookup(var.usersage ,"${var.username}")}"
  
}


#using cmd: terraform plan -var username=saurav







Changes to Outputs:
  + userage = "my name is gaurav and age is  20"
