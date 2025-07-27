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
