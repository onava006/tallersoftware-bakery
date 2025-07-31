variable "name" {
  description = "Nombre del servicio"
  type        = string
}


variable "image" {
  description = "Imagen del contenedor"
  type        = string
}

variable "project" {
  type =  string
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
variable "db_connection_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "frontend_service_account_email"{
  type = string
}