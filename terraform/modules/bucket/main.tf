# An example bucket

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket.html
resource "google_storage_bucket" "example_bucket" {
  name          = "dthor_my_example_bucket"
  location      = var.location
  storage_class = "STANDARD" # https://cloud.google.com/storage/docs/storage-classes
  # project       = ""

  # Delete the bucket even if it still contains data.
  force_destroy = true

  # This might be dependant on org policy. For now, don't define.
  #uniform_bucket_level_access = true

  # Don't bother with object versioning to save cost.
  versioning {
    enabled = false
  }

  # Lifecycle rules of GCS objects
  # See https://cloud.google.com/storage/docs/lifecycle#configuration
  # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket.html#lifecycle_rule
  lifecycle_rule {
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket.html#nested_action
    action {
      # Options are Delete, SetStorageClass, AbortIncompleteMultipartUpload
      type = "Delete"
    }

    # Must satisfy _all_ conditions for delete to be allowed
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket.html#nested_condition
    condition {
      # Minimum age since creation, in days
      #age = 10
      # Any files can be deleted. Options are LIVE, ARCHIVED, ANY
      with_state = "ANY"
    }
  }
}
