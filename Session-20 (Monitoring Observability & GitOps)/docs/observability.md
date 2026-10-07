# Observability

Observability is the ability to understand a system's internal state from the telemetry it emits. Monitoring answers whether a known condition is healthy; observability helps investigate why an unexpected condition occurred.

## Three pillars

| Pillar | Meaning | Questions answered | Common tools |
|---|---|---|---|
| Metrics | Numeric measurements sampled over time | Is CPU high? Are requests increasing? | Prometheus, Grafana, CloudWatch |
| Logs | Timestamped event records emitted by applications and infrastructure | What error occurred and what context surrounded it? | Loki, Elasticsearch, OpenSearch, CloudWatch Logs |
| Traces | A request's journey across services represented as spans | Which service or dependency caused latency? | OpenTelemetry, Jaeger, Tempo, X-Ray |

## Why observability is required

- Detect failures before users report them.
- Measure latency, traffic, errors, and saturation.
- Correlate a user request with application logs and downstream calls.
- Support incident response with evidence rather than guesses.
- Identify capacity trends and validate releases.
- Define service-level objectives and alert on meaningful symptoms.

## Kubernetes observability

Kubernetes exposes object state and events through the API, container logs through the runtime, and resource usage through Metrics Server. A typical stack combines Prometheus for metrics, Grafana for dashboards, Alertmanager for notifications, Loki or OpenSearch for logs, and OpenTelemetry for traces. The demo application exposes `/metrics`, while its Deployment adds health probes, resource requests/limits, and Prometheus scrape annotations.

## Monitoring versus observability

Monitoring is the focused detection layer: dashboards, thresholds, and alerts for known failure modes. Observability combines metrics, logs, and traces so engineers can explore unknown failure modes and determine root cause.
