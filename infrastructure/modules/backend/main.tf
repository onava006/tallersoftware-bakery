

resource "google_cloud_run_service" "backend_service" {
  name = var.name
  location = var.region
  project  = var.project

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/tallersoftware-467001/bakery-tallersoftware/backend:latest"
        ports {
          container_port = 8080
        }

         env {
          name  = "DB_HOST"
          value = "/cloudsql/${var.db_connection_name}"
        }

        env {
          name  = "DB_USER"
          value = var.db_user
        }

        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }

        env {
          name  = "DB_NAME"
          value = var.db_name
        }
      }
       container_concurrency = 8 
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# 3. Habilita las APIs necesarias
resource "google_project_service" "artifact_registry" {
  service = "artifactregistry.googleapis.com"
  project = var.project
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
  project = var.project
}

