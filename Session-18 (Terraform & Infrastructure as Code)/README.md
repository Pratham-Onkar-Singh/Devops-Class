# Session 18: Terraform & Infrastructure as Code

This session demonstrates infrastructure provisioning with Terraform and documents the AWS services used in a typical cloud environment.

## Deliverables

| Deliverable | Description |
|---|---|
| [Terraform S3 demo](terraform-s3-demo/) | Complete Terraform workflow for a secure AWS S3 bucket |
| [IAM research](aws-services/01-iam/README.md) | Identity, governance, permissions, and least privilege |
| [EC2 research](aws-services/02-ec2/README.md) | Compute, images, networking, storage, and lifecycle |
| [S3 research](aws-services/03-s3/README.md) | Buckets, objects, storage classes, security, and lifecycle |
| [VPC research](aws-services/04-vpc/README.md) | CIDR, subnets, routes, gateways, and network controls |
| [DynamoDB and RDS research](aws-services/05-dynamodb-rds/README.md) | AWS NoSQL and relational database services |

## Terraform project summary

The demo provisions an S3 bucket in `ap-south-1` with:

- Bucket-owner-enforced object ownership
- Versioning enabled
- AES-256 server-side encryption
- All S3 public-access blocks enabled
- `force_destroy = false` to protect stored objects

The complete command evidence is available in the [Terraform S3 README](terraform-s3-demo/README.md), including initialization, validation, planning, application, state inspection, outputs, AWS API verification, and cleanup.

## Execution evidence

The following screenshots show the completed Terraform workflow:

![Terraform initialization, formatting, and validation](terraform-s3-demo/images/s18-init-validate.png)

*Terraform initialized the AWS provider, formatted the files, and passed validation.*

![Terraform plan, apply, and show](terraform-s3-demo/images/s18-plan-apply-show.png)

*The reviewed plan was applied and the resulting Terraform state was inspected.*

![Terraform output, AWS verification, and destroy](terraform-s3-demo/images/s18-output-destroy.png)

*Terraform outputs and AWS API checks were completed before the resources were destroyed.*

## Structure

```text
Session-18 (Terraform & Infrastructure as Code)/
├── terraform-s3-demo/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   ├── images/
│   └── README.md
└── aws-services/
    ├── 01-iam/README.md
    ├── 02-ec2/README.md
    ├── 03-s3/README.md
    ├── 04-vpc/README.md
    └── 05-dynamodb-rds/README.md
```
