#join functions


variable users {
    type = list
    default =["gaurav", "saurav", "ankit"]
  
}

output printfirst {
    value ="first user is ${join(",",var.users)}"
  
}
