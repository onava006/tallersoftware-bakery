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
  region     = var.location
  name   = "backend"
  image  = var.backend_image
  project = var.project_id
  db_user = var.db_user
  db_password = var.db_name
  db_connection_name = module.database.postgres_connection_name
  db_name = module.database.app_db_name
   frontend_service_account_email = module.frontend.frontend_service_account_email

}

module "frontend" {
  source     = "./modules/frontend"
  location     = var.location
  name   = "website"
  image  = var.frontend_image
  project = var.project_id
  backend_url  = module.backend.url
  backend_service_name = module.backend.backend_service_name
}

module "database"{
  source = "./modules/storage/database"
  location     = var.location
  region = var.location
  db_user = var.db_user
  db_password = var.db_name  
  network_name = var.network_name
}

module "permissions"{
  source = "./modules/permissions"
  project = var.project_id
  db_user = var.db_user
  db_password = var.db_name
   postgres_instance_name = module.database.postgres_instance_name
   backend_service_account_name = module.backend.backend_service_account_name
  backend_service_name          = module.backend.backend_service_name
  backend_service_location      = module.backend.backend_service_location
   run_service_account_email = module.backend.run_service_account_email
   }

