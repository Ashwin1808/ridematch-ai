variable "public_subnet_1_id" {
  type = string
}

variable "backend_sg_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "instance_type" {
  type = string
}
variable "instance_count" {
  type = number
}