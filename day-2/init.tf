Initialization

The first command to run for a new configuration — or after checking out an existing configuration from version control — is terraform init. Subsequent commands will use local settings and data that are initialized by terraform init.

Terraform uses a plugin-based architecture to support hundreds of infrastructure and service providers. The terraform init command downloads and installs providers used within the configuration, which in this case is the aws provider.
