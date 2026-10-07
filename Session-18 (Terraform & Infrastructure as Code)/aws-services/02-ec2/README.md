# 02. EC2 — Compute

## What is EC2?

Amazon Elastic Compute Cloud (EC2) provides resizable virtual servers. An instance combines an AMI, instance type, network placement, storage, security controls, and an IAM role.

## Main concepts

| Concept | Meaning |
|---|---|
| AMI | A versioned image containing the operating system and initial software used to launch an instance. |
| Instance type | The CPU, memory, network, and storage characteristics of the virtual machine, such as the general-purpose `t` families. |
| Key pair | An asymmetric key used to authenticate to an instance, traditionally through SSH. The private key must never be committed. |
| Security Group | A stateful virtual firewall attached to network interfaces. It has allow rules only; return traffic is automatically allowed. |
| EBS | Persistent block storage volumes attached to EC2 instances, with configurable size, type, performance, encryption, and snapshots. |
| Public IP | An internet-routable address mapped to the instance while it is associated; an Elastic IP is a persistent allocation. |
| Private IP | The address used inside the VPC. It remains associated with the network interface through stop/start lifecycle changes. |

## Instance lifecycle

`pending` → `running` → `stopping`/`stopped` → `shutting-down` → `terminated`. Stop preserves EBS volumes but releases many instance resources; terminate deletes the instance and may delete root storage according to its setting. Reboots keep the instance allocation but restart the operating system.

## Public versus private placement

An instance in a public subnet needs a route to an Internet Gateway and a public or Elastic IP. A private instance has only private addressing and reaches the internet through a NAT Gateway; inbound administration is normally through Systems Manager or a bastion design.

## Common use cases

EC2 supports web servers, batch workers, self-managed databases, legacy applications, build runners, appliances, and workloads needing OS-level control. Auto Scaling Groups and load balancers add availability and elasticity.
