# ================================================
# Best Practice Dockerfile - Flask DevOps Project
# ================================================

# 1. Gunakan base image spesifik + slim (bukan :latest)
FROM python:3.11-slim-bookworm

# 2. Install system deps dengan --no-install-recommends + clean cache
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 3. Buat user non-root (security best practice)
RUN useradd -m -u 1000 appuser

# 4. Set working directory
WORKDIR /app

# 5. Copy requirements dulu (layer caching — build jauh lebih cepat)
COPY requirements.txt .

# 6. Install Python deps tanpa cache
RUN pip install --no-cache-dir -r requirements.txt

# 7. Copy kode aplikasi
COPY . .

# 8. Ubah ownership ke non-root user
RUN chown -R appuser:appuser /app

# 9. Switch ke non-root user
USER 1000

# 10. Expose port
EXPOSE 5000

# HEALTHCHECK best practice
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -fs http://localhost:5000/health || exit 1

# Jalankan dengan gunicorn untuk production (lebih stabil & performa lebih baik)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
