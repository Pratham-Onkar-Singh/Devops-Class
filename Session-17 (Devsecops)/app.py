import os

from flask import Flask, jsonify, request

app = Flask(__name__)


@app.get("/")
def index():
    return jsonify(
        application="session-17-devsecops-demo",
        version=os.getenv("APP_VERSION", "dev"),
        environment=os.getenv("APP_ENVIRONMENT", "development"),
    )


@app.get("/health")
def health():
    return jsonify(status="healthy")


@app.get("/ready")
def ready():
    return jsonify(status="ready")


@app.post("/api/calculate")
def calculate():
    payload = request.get_json(silent=True) or {}
    try:
        first = float(payload["a"])
        second = float(payload["b"])
        operation = payload["operation"]
    except (KeyError, TypeError, ValueError):
        return jsonify(error="a, b, and operation are required"), 400

    if operation == "add":
        result = first + second
    elif operation == "subtract":
        result = first - second
    elif operation == "multiply":
        result = first * second
    elif operation == "divide":
        if second == 0:
            return jsonify(error="division by zero is not allowed"), 400
        result = first / second
    else:
        return jsonify(error="operation must be add, subtract, multiply, or divide"), 400

    return jsonify(a=first, b=second, operation=operation, result=result)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "5000")))
