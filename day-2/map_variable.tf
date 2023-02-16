#map variable
variable "usersage" {
    type = map
    default = {
    gaurav =20
    saurav = 30
    }
}
output  "userage"{
    value = "my name is gauarv and age is  ${lookup(var.usersage ,"gaurav")}"
  
}


o/p:
Changes to Outputs:
  + userage = "my name is gauarv and age is  20"

You can apply this plan to s
