# DevOps Flask CI/CD + Kubernetes

## Overview
Project ini membangun **CI/CD pipeline lengkap** menggunakan GitHub Actions untuk otomatisasi build, test, dan push Docker image aplikasi Flask. Kemudian deploy ke Kubernetes (Minikube) dengan rolling update zero-downtime.  
Tujuannya: mengubah deployment manual menjadi satu command push-to-deploy — sesuai kebutuhan on-prem/hybrid.

## Tech Stack
- Backend: Flask (Python)
- Container: Docker
- CI/CD: GitHub Actions
- Orchestration: Kubernetes (Minikube)
- Documentation: Markdown + Mermaid

## Architecture Diagram
```mermaid
flowchart LR
    A[Developer Push Code] --> B[GitHub Actions]
    B --> C[Build & Test]
    C --> D[Push Docker Image to Docker Hub]
    D --> E[Minikube Kubernetes]
    E --> F[Deployment + Service]
```
---
## Milestone 1 - Flask app
- Setup Repo Github
- Flask app sederhana dengan health check

### How to Run Locally
```bash
git clone https://github.com/seizenz7/devops-flask-ci-cd-kubernetes.git
cd devops-flask-ci-cd-kubernetes
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
```

### Screenshots (Flask app)
Flask Home \
<img src="screenshots/01-flask-home.png" alt="Flask Home"> \
Health Check \
<img src="screenshots/01-health-check.png" alt="Health Check">

### Challenges & Learning
- Challenge: Mengatur virtual environment dan GitHub repo di WSL Windows
- Learning: Menggunakan virtual environment + requirements.txt membuat project selalu reproducible dan mudah diaudit
---
## Milestone 2 - Docker
- Dockerfile dengan layer caching + HEALTHCHECK menggunakan /health endpoint
- Image berhasil di-build & di-run lokal

### How to Run with Docker
```bash
docker build --no-cache -t devops-flask:latest .
docker run -d -p 5000:5000 devops-flask
```

### Screenshots (Docker)
<img src="screenshots/02-docker-build.png" alt="Docker Build">
<img src="screenshots/02-docker-inspect-health.png" alt="Docker Health Check">

### Challenges & Learnings 
- Challenge: Health check status Unhealthy karena curl not found di container
- Learning: Selalu rebuild dengan --no-cache setelah ubah Dockerfile — ini kebiasaan penting untuk reproducibility di lingkungan on-prem
