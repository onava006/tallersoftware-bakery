resource "google_cloud_run_service_iam_member" "frontend_can_invoke_backend" {

  role     = "roles/run.invoker"
  member   = "serviceAccount:frontend-service-account@${var.project}.iam.gserviceaccount.com"
   service  = var.backend_service_name
  location = var.backend_service_location
}



resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = var.postgres_instance_name
  password = var.db_password
}

resource "google_project_iam_member" "cloud_run_sql_access" {
  project = var.project
  role    = "roles/cloudsql.client"
member = "serviceAccount:${var.run_service_account_email}"
}


