FROM python:3.12-alpine
WORKDIR /app
COPY index.html .
EXPOSE 9091
CMD ["python", "-m", "http.server", "9091", "--bind", "0.0.0.0"]

