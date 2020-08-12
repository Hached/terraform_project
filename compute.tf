resource "google_compute_instance" "vm_instance" {
  name         = var.vm_instance_name
  machine_type = var.vm_instance_type
  zone         = var.gcp_zone
  count        = 1
  tags         = ["ssh-enabled"]

  boot_disk {
    initialize_params {
      image = var.ami
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "${var.user}:${file("${var.instance_public_key}")}"
  }
  labels = var.labels
  service_account {
    scopes = []
  }
}



resource "null_resource" "test-cnx" {

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.user
      timeout     = "500s"
      host        = google_compute_instance.vm_instance[0].network_interface[0].access_config[0].nat_ip
      private_key = file(var.instance_private_key)
    }

    inline = [
      "nc -zv ${google_sql_database_instance.postgres.ip_address.0.ip_address} 5432",
    ]
  }

  depends_on = [google_compute_firewall.allow-ssh, google_sql_database_instance.postgres]
}


