terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
    version = "3.5.0"
    project = "qwiklabs-gcp-03-9aa8b3de2bc8"
    region = "us-central1"
    zone = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
}
