module "vpc" {
    source = "git::https://github.com/Sreenivasulu18/terraform-aws-vpc.git?ref=main"
    
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags

    # public subnet
    public_subnet_cidrs = var.public_subnet_cidrs

    # private subnet
    private_subnet_cidrs = var.private_subnet_cidrs

    # databse subnet
    database_subnet_cidrs = var.database_subnet_cidrs

    is_peering_required = true
} 

