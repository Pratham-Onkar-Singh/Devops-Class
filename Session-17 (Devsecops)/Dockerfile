FROM python:3.13-alpine

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app
COPY requirements.txt .
# pip, setuptools, and wheel are build tooling and are not needed at runtime.
RUN pip install --no-cache-dir -r requirements.txt \
    && python -m pip uninstall -y pip setuptools wheel \
    && rm -rf /root/.cache /tmp/*
COPY app.py .

EXPOSE 5000
USER nobody
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "1", "app:app"]
