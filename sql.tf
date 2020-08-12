resource "google_sql_database_instance" "postgres" {
  name             = var.db_instance_name
  database_version = var.postgres_engine_version
  depends_on       = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = var.db_instance_type
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.self_link
    }
  }
}