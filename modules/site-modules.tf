
// define an s3 backend here
terraform {
  backend "s3" {
    bucket = "workshop-tf-state"
    key = "workshop-site-state/terraform.tfstate"
    dynamodb_table = "tf-workshop-site-locks"
    region = "???"
  }
}


provider "aws" {
  region = "???"
}

module "vpc" {
  source = "../"

  environment = "workshop-production"
  region = "???"
  vpc_cidr =  "172.???.???.???/???"
  private_subnets = "172.???.???.???/???"  
  public_subnets  = "172.???.???.???/???"  

  //fill 2 availability zones associated with the region
  azs  =  "???, ???"

  enable_dns_support = true
  enable_dns_hostnames = true

}

output "environment" {
  value = module.vpc.environment
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "admin_key_name" {
  value = module.vpc.admin_key_name
}


output "private_subnets" {
value = module.vpc.private_subnets
}


output "public_subnets" {
  value = ???
}

output "vpc_id" {
  value = ???
}


