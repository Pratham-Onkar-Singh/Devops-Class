from app import app


def test_healthz():
    response = app.test_client().get("/healthz")
    assert response.status_code == 200
    assert response.get_json()["status"] == "healthy"


def test_tasks():
    response = app.test_client().get("/api/tasks")
    assert response.status_code == 200
    assert response.get_json()["tasks"][0]["id"] == 1


def test_metrics():
    response = app.test_client().get("/metrics")
    assert response.status_code == 200
    assert b"taskboard_http_requests_total" in response.data
