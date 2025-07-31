output "url" {
  description = "URL pública del backend"
  value       = google_cloud_run_service.backend_service.status[0].url
}

output "backend_service_account_name" {
  value = google_cloud_run_service.backend_service.template[0].spec[0].service_account_name
}

output "backend_service_name" {
  value = google_cloud_run_service.backend_service.name
}

output "backend_service_location" {
  value = google_cloud_run_service.backend_service.location
}

output "backend_service_url" {
  value = google_cloud_run_service.backend_service.status[0].url
}
