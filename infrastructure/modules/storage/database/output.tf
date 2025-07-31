output "postgres_instance_name" {
  value = google_sql_database_instance.postgres_instance.name
}
output "postgres_connection_name" {
  value = google_sql_database_instance.postgres_instance.connection_name
}

output "app_db_name" {
  value = google_sql_database.app_db.name
}