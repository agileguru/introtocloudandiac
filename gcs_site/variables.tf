variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "bucket_project" {
  type        = string
  description = "The Project of the bucket instance"
}

variable "bucket_zone" {
  type        = string
  description = "The Region of the bucket instance"
}

variable "bucket_tier" {
  type        = string
  default     = "STANDARD"
  description = "The instance tiers"
}
