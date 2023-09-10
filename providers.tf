# Define GCP Provider

terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = ">= 4.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project = var.project-id
  region = var.region
  zone = var.zone
}