resource "google_cloud_run_service" "backend" {
  name = var.name
  location = var.location

  template {
    spec {
      containers {
        image = var.image
        ports {
          container_port = 3000
        }
      }
    }
  }


}
   traffics {
    percent         = 100
    latest_revision = true
  }


