resource "google_compute_global_address" "default" {
  project      = var.lb_project_id
  name         = "${var.lb_name}-address"
  address_type = "EXTERNAL"

}

resource "google_compute_backend_bucket" "bucket_backend" {
  name        = var.bucket_backend_name
  bucket_name = var.bucket_name
  enable_cdn  = false
}

resource "google_compute_url_map" "url_map" {
  name            = var.lb_name
  default_service = google_compute_backend_bucket.bucket_backend.id
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name        = "${var.lb_name}-frontend"
  target      = google_compute_target_http_proxy.target_http_proxy.id
  port_range  = var.http_health_check_port
  ip_address  = google_compute_global_address.default.id
  ip_protocol = "TCP"

  depends_on = [
    google_compute_global_address.default
  ]
}

resource "google_compute_target_http_proxy" "target_http_proxy" {
  name    = "${var.lb_name}-target-http-proxy"
  url_map = google_compute_url_map.url_map.id
}
