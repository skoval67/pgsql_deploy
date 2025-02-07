resource "google_compute_instance" "sw-db-dev" {

  desired_status = "RUNNING"

  name                      = "sw-db-dev"
  machine_type              = "e2-standard-4"
  allow_stopping_for_update = true
  can_ip_forward            = true

  tags = ["db", "dev"]

  boot_disk {
    auto_delete = true
    device_name = "boot"
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 40
      type  = "pd-standard"
    }
  }

  attached_disk {
    source = google_compute_disk.postgres-data-dev.name
  }

  network_interface {
    network_ip = "10.0.0.10"
    network    = data.google_compute_network.checkpoint-network.name
    subnetwork = data.google_compute_subnetwork.checkpoint-subnetwork.name
  }
  metadata = {
    ssh-keys       = join("\n", [for key in var.ssh_keys : "${key.user}:${key.publickey}"])
    startup-script = "ip link set dev ens4 mtu 1460"
    enable-osconfig = "TRUE"
  }
}

resource "google_compute_instance" "sw-db-prod" {

  desired_status = "RUNNING"

  name                      = "sw-db-prod"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  can_ip_forward            = true

  tags = ["db", "prod"]

  boot_disk {
    auto_delete = true
    device_name = "boot"
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 40
      type  = "pd-standard"
    }
  }

  attached_disk {
    source = google_compute_disk.postgres-data-prod.name
  }

  network_interface {
    network_ip = "10.0.10.10"
    network    = data.google_compute_network.checkpoint-network.name
    subnetwork = data.google_compute_subnetwork.checkpoint-subnetwork.name
  }
  metadata = {
    ssh-keys       = join("\n", [for key in var.ssh_keys : "${key.user}:${key.publickey}"])
    startup-script = "ip link set dev ens4 mtu 1460"
  }
}
