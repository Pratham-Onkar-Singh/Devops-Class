data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "final" {
  cidr_block           = "10.21.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "session21-vpc" }
}

resource "aws_internet_gateway" "final" {
  vpc_id = aws_vpc.final.id
  tags   = { Name = "session21-igw" }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.final.id
  cidr_block              = "10.21.1.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags                    = { Name = "session21-public-subnet" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.final.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.final.id
  }
  tags = { Name = "session21-public-routes" }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_s3_bucket" "artifacts" {
  bucket        = var.bucket_name
  force_destroy = false
  tags          = { Name = "session21-artifacts" }
}

resource "aws_s3_bucket_ownership_controls" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  rule {
    apply_server_side_encryption_by_default { sse_algorithm = "AES256" }
  }
}

resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket                  = aws_s3_bucket.artifacts.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
