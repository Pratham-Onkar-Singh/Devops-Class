output "aws_region" {
  description = "AWS region used by the deployment."
  value       = var.aws_region
}

output "vpc_id" {
  description = "ID of the demo VPC."
  value       = aws_vpc.demo.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "instance_id" {
  description = "ID of the demo EC2 instance."
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IP assigned to the demo EC2 instance."
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "HTTP URL for the demo web server."
  value       = "http://${aws_instance.web.public_ip}"
}

output "bucket_name" {
  description = "Name of the demo S3 bucket."
  value       = aws_s3_bucket.artifacts.id
}

output "bucket_arn" {
  description = "ARN of the demo S3 bucket."
  value       = aws_s3_bucket.artifacts.arn
}
