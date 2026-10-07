# 05. DynamoDB and RDS — Database Services

## DynamoDB

Amazon DynamoDB is a fully managed NoSQL key-value and document database. A table stores items; each item is a collection of attributes. The partition key distributes data, while an optional sort key orders related items within a partition and enables range queries.

| Concept | Meaning |
|---|---|
| NoSQL | A non-relational model optimized for known access patterns and horizontal scale. |
| Table | A named collection of items with a defined primary-key schema. |
| Item | One record in a table. |
| Attribute | A typed field within an item. |
| Partition key | Required key whose value determines the logical partition. High-cardinality values distribute load. |
| Sort key | Optional second key that creates a composite primary key and supports ordered queries. |

DynamoDB suits serverless APIs, user profiles, sessions, carts, event metadata, IoT data, and high-throughput workloads that can be modeled around predictable access patterns. Secondary indexes, streams, TTL, on-demand capacity, and provisioned capacity extend the design.

## RDS

Amazon Relational Database Service manages relational database engines while AWS handles provisioning, backups, patching, monitoring, and much of the operational work. Supported engines include Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle, and SQL Server.

| Concept | Meaning |
|---|---|
| DB instance | Compute and storage resources running a relational engine. |
| Security | VPC private subnets, security groups, encryption, IAM/database authentication, and least-privilege users. |
| Backups | Automated point-in-time recovery plus manual snapshots. |
| Multi-AZ | Synchronous standby/failover design for availability; the standby is not a read endpoint. |
| Read replica | Asynchronous replica used to scale read traffic or support reporting. |

RDS suits transactions, joins, referential integrity, existing SQL applications, ERP systems, and workloads that need a managed relational engine. Choose DynamoDB for access-pattern-driven scale and RDS when relational semantics and SQL are central.
