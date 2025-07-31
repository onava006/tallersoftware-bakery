variable "name" {
    type = string
}

variable "location" {
  type = string
}

variable "image" {
  type = string
}

variable "project" {
  type =  string
}

variable "backend_url" {
  type        = string
  description = "URL del backend para consumir desde el frontend"
}