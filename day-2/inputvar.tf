#Input Variable – These are used to set values to configure the Infrastructure with or without the type name and default values.
#Input variables:

variable "vm_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 80
      external = 443
      protocol = "http"
    }
  ]
}
#n the above snippet, “vm_ports” is the variable name and it is declared as list type and hence it is mentioned as “list(object({}))“. Then it is also having the default values in “default” section.
