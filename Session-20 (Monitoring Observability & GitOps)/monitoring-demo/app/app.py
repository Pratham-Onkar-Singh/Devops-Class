import logging
import os
import time

from flask import Flask, jsonify, request
from prometheus_client import Counter, Gauge, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

REQUEST_COUNT = Counter(
    "demo_http_requests_total",
    "Total HTTP requests handled by the demo application",
    ["method", "endpoint", "status"],
)
LAST_HEALTH_CHECK = Gauge(
    "demo_last_health_check_unixtime",
    "Unix timestamp of the last successful health check",
)
START_TIME = time.time()

logging.basicConfig(
    level=os.getenv("LOG_LEVEL", "INFO"),
    format="%(asctime)s %(levelname)s %(message)s",
)
logger = logging.getLogger(__name__)


def record_request(endpoint: str, status: int) -> None:
    REQUEST_COUNT.labels(request.method, endpoint, str(status)).inc()


@app.get("/")
def index():
    status = 200
    record_request("/", status)
    logger.info("application_request endpoint=/ status=%s", status)
    return jsonify({"service": "session20-monitoring-demo", "status": "ok"})


@app.get("/healthz")
def healthz():
    status = 200
    LAST_HEALTH_CHECK.set(time.time())
    record_request("/healthz", status)
    return jsonify({"status": "healthy", "uptime_seconds": round(time.time() - START_TIME, 2)})


@app.get("/ready")
def ready():
    status = 200
    record_request("/ready", status)
    return jsonify({"status": "ready"})


@app.get("/metrics")
def metrics():
    return generate_latest(), 200, {"Content-Type": CONTENT_TYPE_LATEST}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
