

resource "google_cloud_run_v2_service" "backend_service" {
  name = var.name
  location = var.region
  project  = var.project

  template {

      containers {
        image = "us-central1-docker.pkg.dev/tallersoftware-467001/bakery-tallersoftware/backend:latest"
        ports {
          container_port = 8080
        }

         volume_mounts {
          name       = "cloudsql"
          mount_path = "/cloudsql"
        }

         env {
          name  = "DB_HOST"
            value = "/cloudsql/tallersoftware-467001:us-central1:postgres-instance"
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
    volumes {
        name = "cloudsql"

        cloud_sql_instance {
          instances = ["tallersoftware-467001:us-central1:postgres-instance"]
        }
      }
    
  }
  
traffic {
  type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  percent = 100
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

resource "google_project_iam_member" "run_sql_access" {
  project = var.project
  role    = "roles/cloudsql.client"
 member  = "serviceAccount:${google_service_account.run_sa.email}"
}

