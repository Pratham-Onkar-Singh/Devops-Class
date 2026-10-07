# GitOps

Argo CD treats the Kubernetes manifests in the Git repository as the desired state. The `argocd-application.yaml` object points Argo CD to the `kubernetes/` directory, enables automated synchronization, prunes removed objects, and self-heals drift.

## Apply after Argo CD is installed

```bash
kubectl apply -f gitops/argocd-application.yaml
kubectl -n argocd get application final-devops-taskboard
kubectl -n argocd describe application final-devops-taskboard
```

## Workflow

```text
Git commit → pull request → merge → Argo CD detects revision
→ applies manifests → reports Synced/Healthy → self-heals drift
```
