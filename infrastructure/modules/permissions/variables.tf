
variable "project" {
  type =  string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "postgres_instance_name" {
  type = string
}

variable "backend_service_account_name" {
  type = string
}

variable "backend_service_name" {
  type = string
}

variable "backend_service_location" {
  type = string
}
