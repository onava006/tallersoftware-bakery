terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0"
}

provider "google" {
  project = var.project_id
  region  = var.location
}

module "backend" {
  source     = "./modules/backend"
  location     = var.location
  name   = "backend"
  image  = var.backend_image
  project = var.project_id
}

module "frontend" {
  source     = "./modules/frontend"
  location     = var.location
  name   = "website"
  image  = var.frontend_image
  project = var.project_id
}

module "permissions"{
  source = "./modules/permissions"
  project = var.project_id
}

