terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("../playground-383803-a13c567b637a.json")
  project     = "playground-383803"
  region      = "us-west1"
  zone        = "us-west1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
