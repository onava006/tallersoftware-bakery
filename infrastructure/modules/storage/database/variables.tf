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
variable "network_name" {
  type = string
  description = "Nombre completo de la red VPC donde crear la conexión privada"
}