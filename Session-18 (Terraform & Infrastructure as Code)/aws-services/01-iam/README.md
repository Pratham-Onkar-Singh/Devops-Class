# 01. IAM — Governance

## What is IAM?

AWS Identity and Access Management (IAM) controls who can authenticate to AWS and which actions they can perform on which resources. IAM is global, and its policy engine evaluates identity-based and resource-based policies to produce an allow or deny decision.

## Core concepts

| Concept | Meaning |
|---|---|
| User | A long-lived identity for a person or workload that needs credentials. Human users should normally use federation and temporary credentials instead. |
| Group | A collection of users to which common permissions can be attached. Groups cannot contain roles. |
| Role | An assumable identity that provides temporary credentials to AWS services, users, or external identities. |
| Policy | A JSON document describing allowed or denied actions, resources, and optional conditions. |
| Permission | The effective authorization resulting from applicable policies. An explicit deny overrides an allow. |

## Least privilege

Least privilege grants only the actions, resources, and conditions required for a task, for only as long as they are needed. Start with a narrow policy, observe access-denied events, and expand deliberately. Avoid `Action: "*"` or `Resource: "*"` except where the service requires it and the scope is understood.

## IAM best practices

- Use federation and IAM Identity Center for human access.
- Require MFA for privileged users and protect the root user with MFA.
- Do not create root access keys.
- Prefer roles and short-lived credentials over long-lived access keys.
- Use groups or permission sets instead of attaching repeated policies to users.
- Apply least privilege and review permissions with Access Analyzer.
- Separate production, development, and security administration duties.
- Rotate or replace unavoidable access keys and monitor CloudTrail activity.
- Use conditions such as source VPC, MFA presence, encryption, and approved regions where appropriate.

## Common use cases

IAM provides an EC2 instance role for reading S3, a CI/CD role for deploying infrastructure, cross-account administrator access, read-only auditor access, and service-to-service authorization without embedding credentials in code.
