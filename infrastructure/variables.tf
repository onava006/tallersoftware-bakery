variable "project_id" {
  type        = string
  description = "ID del proyecto de Google Cloud"
}

variable "location" {
  type        = string
  description = "Región para desplegar recursos"
  default     = "us-central1"

}

variable "backend_image" {
  type = string
  description = "imagen a usar"

}

variable "frontend_image" {
  type = string
  description = "imagen a usar sitio web"

}

variable "db_user" {
  type        = string
  description = "Nombre de usuario de la base de datos"
}

variable "db_password" {
  type        = string
  description = "Contraseña de la base de datos"
  sensitive   = true
}

variable "db_name" {
  type        = string
  description = "Nombre de la base de datos"
}

variable "db_instance_connection_name" {
  type        = string
  description = "Conexión a la instancia de Cloud SQL (formato: project:region:instance)"
}
