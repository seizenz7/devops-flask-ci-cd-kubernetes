# Base image ringan untuk production
FROM python:3.11-slim

# Install curl untuk HEALTHCHECK + bersihkan cache apt
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements dulu (layer caching best practice)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy kode app
COPY . .

EXPOSE 5000

# HEALTHCHECK pakai endpoint /health kita
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -fs http://localhost:5000/health || exit 1

CMD ["python", "app.py"]
