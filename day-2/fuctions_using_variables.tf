#string functions


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

output helloworldtitle{
    value = "${title(var.users[0])}"
}






0/p:
Changes to Outputs:
  + helloworldlower = "ankit"
  + helloworldtitle = "Gaurav"
  + helloworldupper = "SAURAV"
  + printfirst      = "first user is gaurav----->saurav----->Ankit"
