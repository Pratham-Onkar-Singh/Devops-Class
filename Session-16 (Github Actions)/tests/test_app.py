from app import app


def client():
    app.config.update(TESTING=True)
    return app.test_client()


def test_health_and_ready():
    test_client = client()
    assert test_client.get("/health").json == {"status": "healthy"}
    assert test_client.get("/ready").json == {"status": "ready"}


def test_calculator_operations():
    test_client = client()
    response = test_client.post("/api/calculate", json={"a": 6, "b": 3, "operation": "multiply"})
    assert response.status_code == 200
    assert response.json["result"] == 18


def test_invalid_input_is_rejected():
    test_client = client()
    assert test_client.post("/api/calculate", json={"a": 2, "b": 0, "operation": "divide"}).status_code == 400
    assert test_client.post("/api/calculate", json={"a": 2, "b": 3, "operation": "power"}).status_code == 400
