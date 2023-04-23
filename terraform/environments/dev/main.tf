# The full dev environment

locals {
  environment = "dev"
  project_id  = "playground-383803"
  runtime     = "python310"
  credentials = file("../../../playground-383803-a13c567b637a.json")
}

provider "google" {
  project     = local.project_id
  region      = var.region
  credentials = local.credentials
}
