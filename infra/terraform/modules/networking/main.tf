resource "aws_vpc" "ridematch_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  # tags = {
  #   Name        = "ridematch-vpc"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
  tags = merge(var.common_tags, {
    Name = "RideMatch-VPC"
  })
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.ridematch_vpc.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  # tags = {
  #   Name        = "ridematch-public-subnet-1"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
  tags = merge(var.common_tags, {
  Name = "ridematch-public-subnet-1"
})
}

resource "aws_internet_gateway" "ridematch_igw" {
  vpc_id = aws_vpc.ridematch_vpc.id

  # tags = {
  #   Name        = "ridematch-igw"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
  tags = merge(var.common_tags, {
  Name = "ridematch-igw"
})
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.ridematch_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ridematch_igw.id
  }

  # tags = {
  #   Name        = "ridematch-public-route-table"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
    tags = merge(var.common_tags, {
  Name = "ridematch-public-route-table"
})
}

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.ridematch_vpc.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  # tags = {
  #   Name        = "ridematch-public-subnet-2"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
      tags = merge(var.common_tags, {
  Name = "ridematch-public-subnet-2"
})
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.ridematch_vpc.id
  cidr_block              = var.private_subnet_1_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = false

  # tags = {
  #   Name        = "ridematch-private-subnet-1"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
        tags = merge(var.common_tags, {
  Name = "ridematch-private-subnet-1"
})
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.ridematch_vpc.id
  cidr_block              = var.private_subnet_2_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = false

  # tags = {
  #   Name        = "ridematch-private-subnet-2"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
          tags = merge(var.common_tags, {
  Name = "ridematch-private-subnet-2"
})
}