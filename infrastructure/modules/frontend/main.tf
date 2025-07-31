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
      service_account_name = google_service_account.frontend_sa.email    

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
resource "google_service_account" "frontend_sa" {
  account_id   = "frontend-service-account"
  display_name = "Frontend Cloud Run Service Account"
}
resource "google_project_iam_member" "frontend_act_as" {
  project = var.project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.frontend_sa.email}"
}
resource "google_service_account_iam_member" "allow_act_as" {
  service_account_id = google_service_account.frontend_sa.name
  role               = "roles/iam.serviceAccountUser"
  member             = "user:oscar.nvergara@gmail.com" 
}