# GitOps

GitOps manages infrastructure and application configuration through Git. Git is the versioned source of truth, and a controller continuously reconciles the cluster toward the declarative desired state stored in the repository.

## Principles

- **Git as source of truth:** every desired configuration change is reviewed and auditable.
- **Declarative configuration:** manifests describe the desired result rather than imperative commands.
- **Continuous reconciliation:** a controller detects drift and restores the declared state.
- **Versioned delivery:** pull requests provide review, history, rollback, and accountability.

## Workflow

```text
Change manifest in Git
        ↓
Pull request and review
        ↓
Merge to the main branch
        ↓
Argo CD detects the new revision
        ↓
Controller applies and reconciles Kubernetes resources
        ↓
Health and sync status are verified
```

The `gitops/argocd-application.yaml` file defines an Argo CD Application that watches the `monitoring-demo/k8s` path. Automated sync enables pruning of removed resources and self-healing when live state drifts from Git.

## Kubernetes + GitOps

Kubernetes provides the declarative API and controllers for workloads. Argo CD or Flux adds a Git-backed controller that continuously compares Git manifests with live cluster resources. This removes manual configuration drift, makes deployments reproducible, and provides a clear audit trail. Secrets should be handled with Sealed Secrets, External Secrets, or a cloud secret manager rather than committed in plain text.
