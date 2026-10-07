output "vpc_id" {
  value       = aws_vpc.final.id
  description = "Final project VPC ID."
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID."
}

output "bucket_name" {
  value       = aws_s3_bucket.artifacts.id
  description = "Artifact bucket name."
}

output "bucket_arn" {
  value       = aws_s3_bucket.artifacts.arn
  description = "Artifact bucket ARN."
}
