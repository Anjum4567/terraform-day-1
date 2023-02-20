Resources

The resource block defines a piece of infrastructure. A resource might be a physical component such as an EC2 instance, or it can be a logical resource such as a Heroku application.

The resource block has two strings before the block: the resource type and the resource name. In the example, the resource type is “aws_instance” and the name is “example.” The prefix of the type maps to the provider. In our case “aws_instance” automatically tells Terraform that it is managed by the “aws” provider
