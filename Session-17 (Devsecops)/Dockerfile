FROM python:3.13-alpine

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && rm -rf /root/.cache
COPY app.py .

EXPOSE 5000
USER nobody
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "1", "app:app"]
