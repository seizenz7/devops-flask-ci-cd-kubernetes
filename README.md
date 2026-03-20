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
