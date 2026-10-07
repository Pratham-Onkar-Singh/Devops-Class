variable "aws_region" {
  description = "AWS region in which the S3 bucket is created."
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Globally unique lowercase S3 bucket name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must be 3-63 characters, lowercase, and use only letters, numbers, dots, or hyphens."
  }
}

variable "environment" {
  description = "Environment tag applied to the bucket."
  type        = string
  default     = "learning"
}
