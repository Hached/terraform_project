output "vm_pub_ip_addr" {
  value = google_compute_instance.vm_instance[0].network_interface[0].access_config[0].nat_ip
}

output "postgres_pub_ip_addr" {
  value = google_sql_database_instance.postgres.ip_address.0.ip_address
}

output "postgres_priv_ip_addr" {
  value = google_sql_database_instance.postgres.ip_address.0.ip_address
}