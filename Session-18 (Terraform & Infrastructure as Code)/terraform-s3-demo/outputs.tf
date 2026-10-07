output "bucket_name" {
  description = "The created S3 bucket name."
  value       = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket."
  value       = aws_s3_bucket.demo.arn
}

output "bucket_region" {
  description = "The bucket region from the AWS provider."
  value       = var.aws_region
}
