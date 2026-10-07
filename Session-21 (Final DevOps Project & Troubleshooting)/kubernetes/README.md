# Kubernetes deployment

The manifests provide a Deployment, ClusterIP Service, ConfigMap, Secret, Ingress, HPA, probes, and a 1 GiB PVC.

## Local Kind deployment

```bash
cd "Session-21 (Final DevOps Project & Troubleshooting)"
docker build -t final-devops-taskboard:local -f docker/Dockerfile .
kind load docker-image final-devops-taskboard:local
kubectl apply -k kubernetes/
kubectl -n final-devops rollout status deployment/taskboard
```

Verify:

```bash
kubectl -n final-devops get pods,svc,ingress,pvc,hpa
kubectl -n final-devops describe deployment taskboard
kubectl -n final-devops logs -l app.kubernetes.io/name=taskboard --tail=30 --prefix
kubectl -n final-devops port-forward svc/taskboard 8080:80
```

The Secret contains a non-production placeholder only. Use an external secret manager or sealed secret for real credentials.

## Cleanup

```bash
kubectl delete -k kubernetes/
```
