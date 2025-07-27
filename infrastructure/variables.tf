variable "project_id" {
  type        = string
  description = "ID del proyecto de Google Cloud"
}

variable "region" {
  type        = string
  description = "Región para desplegar recursos"
  default     = "us-central1"

}

variable "backend_image" {
  type = string
  description = "imagen a usar"
  default = "value"
}

