terraform {
  backend "remote" {
    organization = "Org"

    workspaces {
      name = "org-infrastructure"
    }
  }
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  access_token = var.gcp_token
  project      = var.project
  region       = var.region
  zone         = var.zone
}
