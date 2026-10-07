# Application

The Taskboard API is a small Flask service used to demonstrate testing, containerization, Kubernetes health checks, metrics, logs, and GitOps delivery.

## Endpoints

| Endpoint | Purpose |
|---|---|
| `/` | Service metadata |
| `/healthz` | Liveness health response |
| `/ready` | Readiness response |
| `/api/tasks` | Example task payload |
| `/metrics` | Prometheus metrics |

## Run locally

```bash
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/bin/pytest -v
.venv/bin/python app.py
```

Then:

```bash
curl http://127.0.0.1:8080/healthz
curl http://127.0.0.1:8080/api/tasks
curl http://127.0.0.1:8080/metrics
```
