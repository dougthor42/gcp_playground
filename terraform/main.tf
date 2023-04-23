terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

# Local variables
locals {
  # For now, prod and dev workspaces are the same project. Because there is no prod.
  default_creds = file("../playground-383803-a13c567b637a.json")
  project_id    = terraform.workspace == "prod" ? "playground-383803" : "playground-383803"
  credentials   = terraform.workspace == "prod" ? local.default_creds : local.default_creds
}

provider "google" {
  credentials = file("../playground-383803-a13c567b637a.json")
  project     = local.project_id
  region      = var.region
  zone        = var.zone
}
