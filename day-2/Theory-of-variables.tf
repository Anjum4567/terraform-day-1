Terraform Variables: Terraform Variable Types 

Terraform Input Variables
Terraform input variables are used as parameters to input values at run time to customize our deployments. Input terraform variables can be defined in the main.tf configuration file but it is a best practice to define them in a separate variable.tf file to provide better readability and organization.
A variable is defined by using a variable block with a label. The label is the name of the variable and must be unique among all the variables in the same configuration.

variables.tf file
variable "resoirceGroupName" {
  type =string
  description ="name of resource group"
  
}
variable "location"{
  type =string
  description ="location of your resoiurce group"
}
The variable declaration can optionally include three arguments:

    .description: briefly explain the purpose of the variable and what kind of value is expected.
    .type: specifies the type of value such as string, number, bool, map, list, etc.
    .default: If present, the variable is considered to be optional and if no value is set, the default value is used.
  Terraform Input Variables
The type argument in a variable block allows you to enforce type constraints on the variables a user passes in. Terraform supports a number of types, including string, number, bool, list, map, set, object, tuple, and any.

If a type isn’t specified, then Terraform assumes the type is any. Now, let’s have a look at some of these terraform variables types and their classification.
Primitive Types

A primitive type is a simple type that isn’t made from any other type. The available primitive types are:

    string: a sequence of characters representing some text, such as “hello”.
    number: a numeric value. The number type can represent both whole numbers like 15 and fractional values such as 6.28318.
    bool: either true or false.
    
Complex Types
A complex type is a type that groups multiple values into a single value. These values could be of a similar type or different types.
    
