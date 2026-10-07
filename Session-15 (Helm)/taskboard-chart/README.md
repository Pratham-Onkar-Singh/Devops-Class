# Task Board Helm Chart

## Purpose

`taskboard-chart` packages the Task Board mini-project as a Helm application chart. It creates a Deployment, ClusterIP Service, and ConfigMap-based HTML page.

## Values

| File | Replicas | Environment | Image |
|---|---:|---|---|
| `values.yaml` | 1 | `development` | `nginx:1.27-alpine` |
| `values-production.yaml` | 3 | `production` | `nginx:1.27-alpine` |

## Templates

| Template | Resource | Role |
|---|---|---|
| `configmap.yaml` | ConfigMap | Supplies the Task Board page. |
| `deployment.yaml` | Deployment | Runs Nginx and mounts the page. |
| `service.yaml` | ClusterIP Service | Exposes the Deployment within the cluster. |
| `_helpers.tpl` | Template helpers | Generates consistent names and labels. |
| `NOTES.txt` | Helm notes | Provides the port-forward command after installation. |

## Release lifecycle

The chart was installed as `taskboard-dev`, upgraded with production values, upgraded with an intentionally invalid image tag, and rolled back to revision 2. The full command record and evidence are in the parent [README](../README.md).
