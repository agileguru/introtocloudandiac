variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "http_health_check_port" {
  type        = number
  default     = 80
  description = "The Http Health Checkport"
}

variable "bucket_backend_name" {
  type        = string
  description = "The Name of the backend"
}

variable "lb_name" {
  type        = string
  description = "The Name of the lb"
}

variable "lb_project_id" {
  type        = string
  description = "The project id of lb"
}
