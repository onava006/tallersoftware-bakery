resource "google_cloud_run_service_iam_member" "frontend_can_invoke_backend" {
  service  = google_cloud_run_service.backend_service.name
  location = google_cloud_run_service.backend_service.location
  role     = "roles/run.invoker"
  member   = "serviceAccount:frontend-service-account@${var.project}.iam.gserviceaccount.com"
}