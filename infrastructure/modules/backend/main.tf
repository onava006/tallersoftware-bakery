

resource "google_cloud_run_service" "backend_service" {
  name = var.name
  location = var.location

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/tallersoftware-467001/bakery-tallersoftware/backend:latest"
        ports {
          container_port = 8080
        }
      }
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
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}