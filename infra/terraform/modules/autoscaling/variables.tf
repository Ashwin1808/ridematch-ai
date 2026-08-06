variable "launch_template_id" {
  type = string
}

variable "private_subnet_1_id" {
  type = string
}

variable "private_subnet_2_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "common_tags" {
  type = map(string)
}

variable "max_size" {
  type = number
}