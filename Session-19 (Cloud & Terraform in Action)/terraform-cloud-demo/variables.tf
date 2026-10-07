variable "aws_region" {
  description = "AWS region used for all regional resources."
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment tag applied to all resources."
  type        = string
  default     = "learning"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must be a valid lowercase S3 bucket name."
  }
}

variable "instance_type" {
  description = "EC2 instance type for the demonstration workload."
  type        = string
  default     = "t3.micro"
}
