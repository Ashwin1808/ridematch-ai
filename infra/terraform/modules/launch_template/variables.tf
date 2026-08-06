variable "instance_type" {
  type = string
}

variable "backend_sg_id" {
  type = string
}

variable "instance_profile_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "jwt_secret" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "gemini_api_key" {
  type      = string
  sensitive = true
}

variable "news_api_key" {
  type      = string
  sensitive = true
}

variable "gnews_api_key" {
  type      = string
  sensitive = true
}