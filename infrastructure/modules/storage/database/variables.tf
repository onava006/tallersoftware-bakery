variable "location" {
  type = string
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "db_user" {
  type        = string
  description = "PostgreSQL username"
}

variable "db_password" {
  type        = string
  description = "PostgreSQL password"
  sensitive   = true
}