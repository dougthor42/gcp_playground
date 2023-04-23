# Variables for the root terraform config

variable "region" {
  type = string
  description = "The region to deploy the resource to"
  default = "us-west1"  # Oregon
}

variable "zone" {
  type = string
  description = "The zone to deploy the resource to"
  default = "us-west1-a"  # Oregon
}
