resource "google_sql_database_instance" "postgres_instance" {
  name             = "postgres-instance"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      # No IP pública (acceso restringido solo por IAM o Cloud Run)
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.id
    }
   availability_type = "ZONAL"

  }

  deletion_protection = false
}

resource "google_compute_network" "vpc" {
  name = "private-vpc"
  auto_create_subnetworks = false
}
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]
}

resource "google_compute_global_address" "private_ip_range" {
  name          = "google-managed-services-my-vpc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.id
}


resource "google_compute_subnetwork" "subnet" {
  name          = "private-subnet"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.location
  network       = google_compute_network.vpc.id
}

resource "google_sql_database" "app_db" {
  name     = "postgres"
  instance = google_sql_database_instance.postgres_instance.name
}

resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.postgres_instance.name
  password = var.db_password
}
