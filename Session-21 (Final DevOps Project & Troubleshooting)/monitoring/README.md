# Monitoring

The application exposes Prometheus metrics at `/metrics`, including request counters and the last successful health-check timestamp. Kubernetes annotations allow simple Prometheus deployments to scrape the service. Prometheus Operator users can apply `servicemonitor.yaml` and `prometheusrule.yaml`.

## Verify telemetry

```bash
kubectl -n final-devops port-forward svc/taskboard 8080:80
curl http://127.0.0.1:8080/metrics
kubectl -n final-devops logs -l app.kubernetes.io/name=taskboard --tail=30 --prefix
```

## Apply Prometheus Operator resources

```bash
kubectl apply -f monitoring/servicemonitor.yaml
kubectl apply -f monitoring/prometheusrule.yaml
```

These two resources require the Prometheus Operator CRDs. The dashboard JSON can be imported into Grafana and is intentionally small enough to extend during the project.
