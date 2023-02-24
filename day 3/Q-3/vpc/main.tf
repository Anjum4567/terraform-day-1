#VPC using remote module from terraform registry 
#tf repositry :is the places where all the tf modules are stored
#central reposirty for terrfaorm we can pull predeifined modules
#im gng to pull a remote module for aws vpc


#child module
module "vpc" {
    source ="terrform-aws-modules/vpc/aws"
    name ="vpc-using-tf-registry"
    cidr="10.0.0.0/16"
    instance_tenancy = "default"
    azs =[var.az1,var.az2]
    private_subnets=["10.0.1.0/24","10.0.2.0/24"]
    public_subnets=["10.0.3.0/24" ,"10.0.4.0/24"]
    enable_nat_gateway = true
    sigle_nat_gateway =true
    one_nat_gateway_per_az=false
    tags={
        "vpc-module-source" = "tf-aws-registry"
        "env" = "dev"
    }
}
