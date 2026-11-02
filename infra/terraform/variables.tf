variable "aws_region" {
  description = "AWS region for RideMatch infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the RideMatch VPC"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
}

variable "availability_zone_2" {
  description = "Second availability zone"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Trusted IPv4 CIDR block permitted to SSH to backend instances. Never use 0.0.0.0/0."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.ssh_allowed_cidr)) && !can(regex("^0\\.0\\.0\\.0/", var.ssh_allowed_cidr))
    error_message = "ssh_allowed_cidr must be a valid IPv4 CIDR block and must not use 0.0.0.0/0."
  }
}
