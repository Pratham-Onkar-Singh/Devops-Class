# Session 20: Monitoring, Observability & GitOps

This session demonstrates how a Kubernetes workload exposes health and telemetry, how monitoring and observability fit together, and how GitOps keeps Kubernetes configuration declarative and version controlled.

## Deliverables

| Deliverable | Location |
|---|---|
| Instrumented monitoring application | [monitoring-demo/app](monitoring-demo/app/) |
| Kubernetes deployment and service | [monitoring-demo/k8s](monitoring-demo/k8s/) |
| Prometheus metrics and alert rules | [monitoring-demo/monitoring](monitoring-demo/monitoring/) |
| GitOps manifests | [gitops/](gitops/) |
| Observability notes | [docs/observability.md](docs/observability.md) |
| GitOps notes | [docs/gitops.md](docs/gitops.md) |
| Execution screenshots | [images/](images/) |

## Monitoring demo

The Python service exposes:

- `/healthz` for liveness and application health
- `/ready` for readiness checks
- `/metrics` in Prometheus format
- `/` for a simple application response

The Kubernetes deployment defines CPU and memory requests/limits, liveness/readiness probes, and structured container logs. Prometheus alert rules cover high CPU, high memory, unavailable replicas, and failed health probes.

## Architecture

```mermaid
flowchart LR
    G[Git repository] --> A[Argo CD / GitOps controller]
    A --> K[Kubernetes cluster]
    K --> P[Monitoring demo Pod]
    P --> H[/healthz and /ready]
    P --> M[/metrics]
    P --> L[Structured logs]
    M --> PM[Prometheus]
    PM --> AL[Alert rules]
    L --> LO[Loki or kubectl logs]
```

## Structure

```text
Session-20 (Monitoring Observability & GitOps)/
├── monitoring-demo/
│   ├── app/
│   ├── k8s/
│   └── monitoring/
├── gitops/
│   └── argocd-application.yaml
├── docs/
│   ├── observability.md
│   └── gitops.md
├── images/
└── README.md
```

The detailed execution workflow and screenshot commands are in [monitoring-demo/README.md](monitoring-demo/README.md).

## Execution evidence

![Application health and Prometheus metrics](images/s20-health-metrics.png)

![Kubernetes resource utilization, logs, and events](images/s20-kubernetes-observability.png)

![GitOps manifest validation and Argo CD sync](images/s20-gitops-sync.png)
