# Terraform infrastructure

Terraform provisions the cloud foundation used by the final project: a VPC, public subnet, Internet Gateway, route table, and encrypted/versioned S3 artifact bucket. The Kubernetes demo can run locally, so no EC2 or managed Kubernetes charges are required.

## Workflow

```bash
cd terraform
export AWS_PROFILE=session18
terraform init
terraform fmt
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
terraform show
terraform output
terraform destroy
```

The S3 bucket uses `BucketOwnerEnforced`, versioning, AES-256 encryption, and all public-access blocks. The bucket is intentionally configured with `force_destroy = false`; keep it empty before `terraform destroy`.
