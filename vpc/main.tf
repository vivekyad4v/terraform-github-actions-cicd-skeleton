resource "aws_vpc" "myvpc" {

  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true

  tags 			=   merge(var.tags, tomap({
                            "description" = "${local.project} VPC",
                            "Name" = local.name_prefix}))
}

resource "aws_subnet" "public-subnet-1" {

  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public-subnets[0]
  availability_zone = var.azs[0]
  map_public_ip_on_launch = "false"

  tags                  =   merge(var.tags, tomap({
                            "description" = "${local.project} VPC public subnet 1",
                            "Name" = "${local.name_prefix}-public-subnet-1"}))
}


resource "aws_subnet" "public-subnet-2" {

  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public-subnets[1]
  availability_zone = var.azs[1]
  map_public_ip_on_launch = "false"

  tags                  =   merge(var.tags, tomap({
                            "description" = "${local.project} VPC public subnet 2",
                            "Name" = "${local.name_prefix}-public-subnet-2"}))
}
