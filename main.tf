terraform {
  required_providers {
    google = {
      version = ">= 4.51.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.51.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}


module "development_site" {
  source         = "./gcs_site"
  bucket_name    = "${var.project}-dev-agileguru-org"
  bucket_zone    = "US"
  bucket_project = var.project
}

module "akshay_site" {
  source         = "./gcs_site"
  bucket_name    = "${var.project}-akshay-agileguru-org"
  bucket_zone    = "US"
  bucket_project = var.project
}

module "common_load_balancer" {
  source              = "./http_load_balancer"
  lb_name             = "development-load-balancer"
  bucket_backend_name = "dev-agile-guru-org-backend"
  bucket_name         = "${var.project}-dev-agileguru-org"
  lb_project_id       = var.project
  depends_on = [
    module.development_site
  ]
}

module "akshay_load_balancer" {
  source              = "./http_load_balancer"
  lb_name             = "akshay-load-balancer"
  bucket_backend_name = "akshay-agile-guru-org-backend"
  bucket_name         = "${var.project}-akshay-agileguru-org"
  lb_project_id       = var.project
  depends_on = [
    module.akshay_site
  ]
}
