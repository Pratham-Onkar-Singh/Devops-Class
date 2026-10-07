# Final troubleshooting challenge

The `broken/` directory contains intentionally faulty examples. They are not included in the normal Kubernetes or Helm deployment.

## Challenge 1: ImagePullBackOff

### Symptom

```bash
kubectl -n final-devops get pods
kubectl -n final-devops describe pod <pod-name>
```

The event reports `ErrImagePull` or `ImagePullBackOff`.

### Root cause

`wrong-image.yaml` references an image tag that does not exist and forces `imagePullPolicy: Always`.

### Fix and verification

Use the valid image tag, load it into Kind, or push it to the registry:

```bash
kind load docker-image final-devops-taskboard:local
kubectl -n final-devops rollout status deployment/taskboard
kubectl -n final-devops get pods
```

## Challenge 2: Configuration failure

### Symptom

```bash
kubectl apply -f troubleshooting/broken/missing-config.yaml
kubectl -n final-devops get pods
kubectl -n final-devops describe pod <pod-name>
```

The pod cannot start because the referenced ConfigMap does not exist.

### Root cause

The deployment references `config-does-not-exist` instead of `taskboard-config`.

### Fix and verification

```bash
kubectl -n final-devops get configmap taskboard-config
kubectl apply -k kubernetes/
kubectl -n final-devops rollout status deployment/taskboard
```

## General investigation sequence

```bash
kubectl get pods -A
kubectl -n final-devops describe pod <pod-name>
kubectl -n final-devops logs <pod-name> --previous
kubectl -n final-devops get events --sort-by=.lastTimestamp
kubectl -n final-devops get deployment,svc,configmap,secret,hpa,pvc
```

The fix is complete only after the root cause is documented, the workload is Ready, logs are healthy, and the endpoint responds successfully.
