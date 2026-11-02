variable "vpc_id" {
  type = string
}

variable "ssh_allowed_cidr" {
  description = "Trusted IPv4 CIDR block permitted to SSH to backend instances."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.ssh_allowed_cidr)) && !can(regex("^0\\.0\\.0\\.0/", var.ssh_allowed_cidr))
    error_message = "ssh_allowed_cidr must be a valid IPv4 CIDR block and must not use 0.0.0.0/0."
  }
}

variable "common_tags" {
  type = map(string)
}