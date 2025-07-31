output "url" {
  description = "URL pública del backend"
  value = google_cloud_run_v2_service.backend_service.uri
  }

output "backend_service_account_name" {
  value = google_cloud_run_v2_service.backend_service.template[0].service_account
}

output "backend_service_name" {
  value = google_cloud_run_v2_service.backend_service.name
}

output "backend_service_location" {
  value = google_cloud_run_v2_service.backend_service.location
  }

output "backend_service_url" {
  value = google_cloud_run_v2_service.backend_service.uri
}

output "run_service_account_email" {
  value = google_service_account.run_sa.email
}
