/*1.output "firstblock" {
    value = "this is the first hello world block"
}
output "secondblock" {
    value = "this is the second hello world block"
}
*/


/*2.variable username{}

output printname {

   value = "hello, ${var.username}"
}
*/

#3.to pass varaiable through command line "terraform plan -var "username=anjummulla" "

/*with deafult var set
 variable username {
  default = "world"

}*/


#4.to define multiple variable 

/*variable username {
    default = "ankita"
  
}
variable age {
    default = "23"

  
}
output printname {
    value = "hello, ${var.username}, your age is ${var.age}"
  
}

terraform apply -var "username=ankita" , -var "age=23" 
*/
  

#5.Variable Types
/*variable username {
    type = string
    default = "world"
  
}
variable age {
    type = number
    
  
}

output printname {
    
  value = "hello, ${var.username} ,your age is ${var.age}"
}

#terraform apply -var "username=ankita" , -var "age=23" */

#6. List Variable
variable users {
    type = list
  
}
output printfirst {
    value = "first user is ${var.users[1]}"  #   + printfirst = "first user is gaurav"

  
}
