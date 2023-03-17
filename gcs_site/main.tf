resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  project       = var.bucket_project
  location      = var.bucket_zone
  storage_class = var.bucket_tier
  versioning {
    enabled = false
  }
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  force_destroy = true
  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket_object" "home_index_html" {
  bucket  = var.bucket_name
  content = var.bucket_name
  name    = "index.html"
  depends_on = [
    google_storage_bucket.bucket
  ]
}

resource "google_storage_bucket_object" "error_404_html" {
  bucket  = var.bucket_name
  content = "Resource not found :( ${var.bucket_name}"
  name    = "404.html"
  depends_on = [
    google_storage_bucket.bucket
  ]
}

resource "google_storage_bucket_iam_member" "public_bucket_rule" {
  bucket = var.bucket_name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
  depends_on = [
    google_storage_bucket.bucket
  ]
}

