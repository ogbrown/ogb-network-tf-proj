locals {
  global_tags = merge(
    var.tags,
    {
      LastApplied = timestamp()
    }
  )
}
provider "aws" {
  region = var.aws_region
}

module "net" {
  source = "../../modules/net"
  # pass networking vars
  aws_region            = var.aws_region
  availability_zone_ids = var.availability_zone_ids
  cidr_blocks           = var.cidr_blocks
  short_project_name    = var.short_project_name
  tags                  = local.global_tags
  vpc_name              = var.vpc_name
  nat_gateway_subnet    = var.nat_gateway_subnet
  my_access_ip          = var.my_access_ip
}




