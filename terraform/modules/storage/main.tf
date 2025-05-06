resource "google_storage_bucket" "bucket" {
  name                     = var.storage_bucket
  location                 = var.project_region
  public_access_prevention = var.access_prevention_policy
  project                  = var.project_id
  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
  lifecycle_rule {
    action {
      type          = var.change_storage_type
      storage_class = var.nearline_storage_class
    }
    condition {
      age = var.nearline_storage_age
    }

  }

  lifecycle_rule {
    action {
      type          = var.change_storage_type
      storage_class = var.coldline_storage_class
    }
    condition {
      age = var.coldline_storage_age
    }

  }

  lifecycle_rule {
    action {
      type          = var.change_storage_type
      storage_class = var.archive_storage_class
    }
    condition {
      age = var.archive_storage_age
    }

  }

  lifecycle_rule {
    action {
      type = var.delete
    }
    condition {
      age = var.delete_age
    }
  }

  logging {
    log_bucket        = google_storage_bucket.logging_bucket.name
    log_object_prefix = var.log_object_prefix
  }

  labels = {
    environment = var.environment
  }

  force_destroy = true
}

resource "google_storage_bucket" "logging_bucket" {
  name     = var.logging_bucket
  location = var.project_region
  project  = var.project_id

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
  public_access_prevention    = var.access_prevention_policy

  lifecycle_rule {
    action {
      type          = var.change_storage_type
      storage_class = var.nearline_storage_class
    }
    condition {
      age = var.nearline_storage_age
    }
  }

  lifecycle_rule {
    action {
      type          = var.change_storage_type
      storage_class = var.coldline_storage_class
    }
    condition {
      age = var.coldline_storage_age
    }
  }

  lifecycle_rule {
    action {
      type          = var.change_storage_type
      storage_class = var.archive_storage_class
    }
    condition {
      age = var.archive_storage_age
    }
  }

  lifecycle_rule {
    action {
      type = var.delete
    }
    condition {
      age = var.delete_age
    }
  }

  labels = {
    environment = var.environment
  }

}
