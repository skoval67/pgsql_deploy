data "google_compute_subnetwork" "checkpoint-subnetwork" {
  name = "check-point-network1-subnet"
}

data "google_compute_network" "checkpoint-network" {
  name = "check-point-network1"
}
