resource "google_compute_disk" "postgres-data-dev" {
  name    = "postgres-data-dev"
  type    = "pd-ssd"
  project = var.project
  zone    = var.zone
  size    = "50"
}

resource "google_compute_disk" "postgres-data-prod" {
  name    = "postgres-data-prod"
  type    = "pd-ssd"
  project = var.project
  zone    = var.zone
  size    = "100"
}
