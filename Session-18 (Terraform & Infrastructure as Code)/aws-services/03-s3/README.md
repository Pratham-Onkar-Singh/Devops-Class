# 03. S3 — Storage

## What is S3?

Amazon Simple Storage Service is highly durable object storage. A bucket is a regional container; an object is data plus metadata identified by a key. S3 is not a mounted block filesystem, although applications can use its APIs or gateway integrations.

## Core concepts

| Concept | Meaning |
|---|---|
| Bucket | A globally unique namespace that stores objects in one AWS Region. |
| Object | A payload, key, metadata, tags, and optional version ID. |
| Storage class | A cost/availability profile such as Standard, Intelligent-Tiering, Standard-IA, One Zone-IA, Glacier Instant Retrieval, Flexible Retrieval, and Deep Archive. |
| Versioning | Retains prior object versions and delete markers so accidental changes can be recovered. |
| Lifecycle policy | Transitions objects between classes or expires current/noncurrent versions based on age and prefixes/tags. |
| Encryption | Server-side encryption with S3-managed keys (SSE-S3), KMS keys (SSE-KMS), or customer-provided keys. |
| Bucket policy | A resource-based JSON policy controlling principals, actions, resources, and conditions. |

## Security and design

Block public access by default, keep Object Ownership set to BucketOwnerEnforced, require TLS with policy conditions, enable versioning for recoverability, and use KMS when auditability or key separation is required. Access Analyzer and CloudTrail help identify unintended sharing and access.

## Common use cases

S3 stores backups, static websites, data-lake objects, application uploads, logs, artifacts, Terraform state, media, and archival data. Prefixes and tags support organization, lifecycle rules, cost allocation, and partitioning for analytics.
