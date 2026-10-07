import logging
import os
import time

from flask import Flask, jsonify, request
from prometheus_client import CONTENT_TYPE_LATEST, Counter, Gauge, generate_latest

app = Flask(__name__)
logging.basicConfig(level=os.getenv("LOG_LEVEL", "INFO"), format="%(asctime)s %(levelname)s %(message)s")
logger = logging.getLogger("taskboard")

REQUESTS = Counter("taskboard_http_requests_total", "HTTP requests handled", ["method", "path", "status"])
HEALTH_CHECK = Gauge("taskboard_last_health_check_unixtime", "Last successful health check timestamp")
START_TIME = time.time()


def observe(path: str, status: int) -> None:
    REQUESTS.labels(request.method, path, str(status)).inc()


@app.get("/")
def index():
    observe("/", 200)
    logger.info("request path=/ status=200")
    return jsonify({"service": "taskboard", "version": os.getenv("APP_VERSION", "1.0.0"), "status": "ok"})


@app.get("/healthz")
def healthz():
    HEALTH_CHECK.set(time.time())
    observe("/healthz", 200)
    return jsonify({"status": "healthy", "uptime_seconds": round(time.time() - START_TIME, 2)})


@app.get("/ready")
def ready():
    observe("/ready", 200)
    return jsonify({"status": "ready"})


@app.get("/api/tasks")
def tasks():
    observe("/api/tasks", 200)
    return jsonify({"tasks": [{"id": 1, "title": "Complete final DevOps project", "done": False}]})


@app.get("/metrics")
def metrics():
    return generate_latest(), 200, {"Content-Type": CONTENT_TYPE_LATEST}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
