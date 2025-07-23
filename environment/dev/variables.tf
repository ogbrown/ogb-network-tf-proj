variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-2"
}
variable "availability_zone_ids" {
  description = "List of availability zone IDs for the VPC"
  type        = list(string)
}
variable "cidr_blocks" {
  description = "Map of CIDR blocks for public subnets"
  type        = map(string)
}
variable "short_project_name" {
  description = "Short name for the project, used in resource names"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "vpc_name" {
  description = "Name of the VPC to use for the Aurora cluster"
  type        = string
}

variable "my_access_ip" {
  description = "Your IP address for security group rules"
  type        = string
}
variable "nat_gateway_subnet" {
  description = "The public subnet to use for the NAT gateway"
  type        = string
}