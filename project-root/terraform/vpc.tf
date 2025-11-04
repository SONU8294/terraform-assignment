# Fetch available availability zones
data "aws_availability_zones" "available" {}

# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

# Take only two availability zones
locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

# Public subnets (in 2 AZs)
resource "aws_subnet" "public" {
  for_each = {
    "10.0.1.0/24" = local.azs[0]
    "10.0.2.0/24" = local.azs[1]
  }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.key
  availability_zone       = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-public-${each.value}"
  }
}

# Private subnets (in 2 AZs)
resource "aws_subnet" "private" {
  for_each = {
    "10.0.101.0/24" = local.azs[0]
    "10.0.102.0/24" = local.azs[1]
  }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.key
  availability_zone = each.value

  tags = {
    Name = "${var.project}-private-${each.value}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project}-igw"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project}-public-rt"
  }
}

# Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}
