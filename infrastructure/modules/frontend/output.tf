output "url" {
  description = "URL pública del sitio web"
  value       = google_cloud_run_service.frontend.status[0].url
}