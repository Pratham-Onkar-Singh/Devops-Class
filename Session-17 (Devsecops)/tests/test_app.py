from app import app


def test_health_and_readiness():
    test_client = app.test_client()
    assert test_client.get("/health").json == {"status": "healthy"}
    assert test_client.get("/ready").json == {"status": "ready"}


def test_multiply():
    test_client = app.test_client()
    response = test_client.post("/api/calculate", json={"a": 6, "b": 3, "operation": "multiply"})
    assert response.status_code == 200
    assert response.json["result"] == 18


def test_invalid_calculation_is_rejected():
    test_client = app.test_client()
    assert test_client.post("/api/calculate", json={"a": 6, "b": 0, "operation": "divide"}).status_code == 400
    assert test_client.post("/api/calculate", json={"a": 6, "b": 3, "operation": "power"}).status_code == 400
