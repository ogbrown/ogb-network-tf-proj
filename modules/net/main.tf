locals {
  net_tags = merge(
    var.tags,
    {
      Name = "${var.short_project_name}-vpc-e2"
    }
  )
}
resource "aws_vpc" "vpc-use2-public" {
  cidr_block                       = var.cidr_blocks["vpc_cidr_block"]
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false
  instance_tenancy                 = "default"

  tags = merge(
  local.net_tags,
  {
    Name = "${var.vpc_name}"
  }, {
    "Public" = "true"
  }
  )

}

resource "aws_subnet" "use2-c-public" {
    vpc_id                   = aws_vpc.vpc-use2-public.id
    availability_zone_id     = var.availability_zone_ids[2]
    cidr_block               = var.cidr_blocks["public_subnet_c"]
    map_public_ip_on_launch  = true
    ipv6_native              = false
    tags = merge(
      local.net_tags,
      {
        Name = "${var.short_project_name}-sub-e2-c-pub"
      }, {
        "Public" = "true"
      }
    )
}

resource "aws_subnet" "use2-b-public" {
  vpc_id                = aws_vpc.vpc-use2-public.id
  availability_zone_id  = var.availability_zone_ids[1]
  cidr_block            = var.cidr_blocks["public_subnet_b"]
  map_public_ip_on_launch                        = true
  ipv6_native                                    = false
  tags = merge(
    local.net_tags,
    {
      Name = "${var.short_project_name}-sub-e2-b-pub"
    }, {
      "Public" = "true"
    }
  )
}

resource "aws_subnet" "use2-a-public" {
  vpc_id                = aws_vpc.vpc-use2-public.id
  availability_zone_id  = var.availability_zone_ids[0]
  cidr_block            = var.cidr_blocks["public_subnet_a"]
  map_public_ip_on_launch                        = true
  ipv6_native                                    = false
  tags = merge(
    local.net_tags,
    {
      Name = "${var.short_project_name}-sub-e2-a-pub"
    }, {
      "Public" = "true"
    }
  )
}

resource "aws_subnet" "use2-c-private" {
  vpc_id                   = aws_vpc.vpc-use2-public.id
  availability_zone_id     = var.availability_zone_ids[2]
  cidr_block               = var.cidr_blocks["private_subnet_c"]
  map_public_ip_on_launch  = false
  ipv6_native              = false
  tags = merge(
    local.net_tags,
    {
      Name = "${var.short_project_name}-sub-e2-c-priv"
    }, {
      "Public" = "false"
    }
  )
}

resource "aws_subnet" "use2-b-private" {
  vpc_id                   = aws_vpc.vpc-use2-public.id
  availability_zone_id     = var.availability_zone_ids[1]
  cidr_block               = var.cidr_blocks["private_subnet_b"]
  map_public_ip_on_launch  = false
  ipv6_native              = false
  tags = merge(
    local.net_tags,
    {
      Name = "${var.short_project_name}-sub-e2-b-priv"
    }, {
      "Public" = "false"
    }
  )
}

resource "aws_subnet" "use2-a-private" {
  vpc_id                   = aws_vpc.vpc-use2-public.id
  availability_zone_id     = var.availability_zone_ids[0]
  cidr_block               = var.cidr_blocks["private_subnet_a"]
  map_public_ip_on_launch  = false
  ipv6_native              = false
  tags = merge(
    local.net_tags,
    {
      Name = "${var.short_project_name}-sub-e2-a-priv"
    }, {
      "Public" = "false"
    }
  )
}
