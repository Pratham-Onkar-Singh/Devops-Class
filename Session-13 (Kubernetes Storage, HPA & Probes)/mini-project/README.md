# Mini Project: Nginx Storage, HPA & Probes

This project combines the Session 13 topics in one workload:

```text
Client --> web-service --> web-app Pods
                              |-- startup, readiness, liveness probes
                              |-- /data --> web-data PVC --> dynamically provisioned PV
Metrics Server --> web-app-hpa --> Deployment replica count
```

`web-app` starts with two Nginx replicas, uses a 500Mi dynamically provisioned PVC, and scales to five replicas when average CPU crosses 50% of the 100m CPU request. The `Recreate` strategy ensures only one Pod mounts the `ReadWriteOnce` claim at a time during a rollout.

## Components

| Resource | Purpose |
|---|---|
| Namespace `production-webapp` | Isolates the project resources |
| PVC `web-data` | Provides 500Mi persistent application storage |
| Deployment `web-app` | Runs two Nginx replicas with resource requests and probes |
| Service `web-service` | Provides stable in-cluster access to Nginx |
| HPA `web-app-hpa` | Scales from 2 to 5 Pods at 50% average CPU utilization |
| Deployment `load-generator` | Creates continuous HTTP traffic for scale testing |

## Deploy

```bash
kubectl apply -f namespace.yaml -f pvc.yaml -f deployment.yaml -f service.yaml -f hpa.yaml
kubectl -n production-webapp rollout status deployment/web-app
kubectl -n production-webapp get pods,pvc,hpa
kubectl -n production-webapp describe pod -l app=web-app
```

## Verify persistent storage

```bash
kubectl -n production-webapp exec deployment/web-app -- sh -c 'echo session-13-persistent-data > /data/student.txt'
kubectl -n production-webapp exec deployment/web-app -- cat /data/student.txt
kubectl -n production-webapp delete pods -l app=web-app
kubectl -n production-webapp rollout status deployment/web-app
kubectl -n production-webapp exec deployment/web-app -- cat /data/student.txt
```

The final command displayed `session-13-persistent-data` after replacement Pods were ready, proving that the PVC data survived the Pod deletion.

The result of the completed persistence and probe check is recorded in [persistence-and-probes.txt](outputs/persistence-and-probes.txt).

The screenshot also shows a `Bound` 500Mi PVC and the configured Pod details. The `describe pod` output lists the startup, readiness, and liveness HTTP probes on port `80`.

![Mini-project persistence and probes](../images/s13-mini-persistence-probes.png)

## Verify probes and Service

```bash
kubectl -n production-webapp get pods
kubectl -n production-webapp describe pod -l app=web-app
kubectl -n production-webapp port-forward service/web-service 8086:80
```

Open `http://127.0.0.1:8086` while the port-forward is active. The Pod description lists the startup, readiness, and liveness HTTP probes.

## Generate load and scale

```bash
kubectl -n production-webapp apply -f load-generator.yaml
kubectl -n production-webapp scale deployment/load-generator --replicas=6
kubectl -n production-webapp get hpa,pods -w
kubectl -n production-webapp top pods
kubectl -n production-webapp describe hpa web-app-hpa
```

If the busybox workload does not cross the CPU target on the local machine, launch ApacheBench Pods instead:

```bash
for number in 1 2 3 4 5 6; do
  kubectl -n production-webapp run ab-load-$number --image=httpd:2.4-alpine --restart=Never --command -- sh -c 'ab -n 100000000 -c 100 http://web-service/ > /dev/null'
done
```

Remove the load Pods after observing scale-up. The HPA uses a 60-second scale-down stabilization window so recovery is visible.

```bash
kubectl -n production-webapp delete deployment load-generator
kubectl -n production-webapp delete pod -l run=ab-load
kubectl -n production-webapp get hpa,pods -w
```

## Cleanup

```bash
kubectl delete namespace production-webapp
```
