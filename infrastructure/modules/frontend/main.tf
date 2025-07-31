resource "google_cloud_run_service" "frontend" {
  name     = var.name
  location = var.location
  project  = var.project



  template {
    spec {
      containers {
        image = var.image
        ports {
          container_port = 80
        }
        env {
          name  = "VITE_BACKEND_URL"
          value = var.backend_url
        }
      }
      service_account_name = "frontend-service-account@${var.project}.iam.gserviceaccount.com"
    

    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}


resource "google_cloud_run_service_iam_member" "frontend_public" {
  location = var.location
  service  = google_cloud_run_service.frontend.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}