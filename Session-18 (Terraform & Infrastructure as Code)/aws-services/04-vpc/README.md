# 04. VPC — Networking

## What is a VPC?

Amazon Virtual Private Cloud is an isolated virtual network with customer-selected IP ranges, subnets, routes, and network controls. A VPC spans Availability Zones within one Region.

## Core concepts

| Concept | Meaning |
|---|---|
| CIDR | The address range for the VPC or subnet, such as `10.0.0.0/16`; subnet ranges must not overlap. |
| Subnet | A range inside one Availability Zone. Its route table determines whether it is public or private. |
| Route table | Destination-to-target rules used to forward traffic to local networks, gateways, NAT, peering, or transit gateways. |
| Internet Gateway | Horizontally scaled VPC attachment that enables internet routing for resources with public addresses. |
| NAT Gateway | Managed outbound internet translation for private-subnet resources; it does not allow unsolicited inbound connections. |
| Security Group | Stateful allow-list firewall attached to ENIs. |
| Network ACL | Stateless subnet boundary filter with ordered allow and deny rules, including both inbound and outbound rules. |

## Public and private subnets

A public subnet has a route such as `0.0.0.0/0 → Internet Gateway`; a resource also needs a public address to be internet reachable. A private subnet has no direct Internet Gateway route and normally uses `0.0.0.0/0 → NAT Gateway` for outbound updates. Private databases and internal services should remain private.

## Design practices

Use non-overlapping CIDRs, at least two Availability Zones for production, separate public/private/database tiers, least-privilege security groups, network ACLs for coarse subnet controls, VPC endpoints for AWS services where useful, and flow logs for investigation.
