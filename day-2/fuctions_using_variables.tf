#functions


variable users {
    type = list
    default =["GaUraV", "SAURAV", "aNKiT"]
  
}

output printfirst {
    value ="first user is ${join("------>",var.users)}"
  
}


output helloworlduppercase {
    value = "${upper(var.users[0])}"
}


output helloworldlowercase {
    value =${lower(var.users[2]}"
}
