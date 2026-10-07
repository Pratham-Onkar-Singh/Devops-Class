# Helm deployment

The `taskboard` chart packages the same application configuration as reusable templates. Values control the image, replica count, resources, ingress, autoscaling, persistence, ConfigMap, and Secret.

## Validate and render

```bash
helm lint helm/taskboard
helm template taskboard helm/taskboard
```

## Install on Kind

```bash
helm upgrade --install taskboard helm/taskboard \
  --namespace final-devops \
  --create-namespace \
  --set image.repository=final-devops-taskboard \
  --set image.tag=local
```

## Verify and rollback

```bash
helm list -n final-devops
helm status taskboard -n final-devops
helm history taskboard -n final-devops
helm upgrade taskboard helm/taskboard -n final-devops --set replicaCount=3
helm rollback taskboard 1 -n final-devops
helm uninstall taskboard -n final-devops
```
