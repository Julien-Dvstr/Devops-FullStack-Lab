# DevOps Fullstack Lab

A production-grade DevOps project demonstrating a complete infrastructure stack — from CI/CD pipeline to Kubernetes orchestration, Infrastructure as Code, and real-time monitoring.

🌍 **Live**: https://juliendvstr.dev

---

## Architecture

    git push
        ↓
    GitHub Actions
        ↓
    Build Docker Image → Push to Docker Hub
        ↓
    SSH to DigitalOcean VPS
        ↓
    Kubernetes Rolling Update (k3s)
        ↓
    Portfolio served by Nginx (2 replicas)
        ↓
    Traefik Ingress → juliendvstr.dev (HTTPS via Cloudflare)

---

## Stack

| Layer | Technology |
|---|---|
| App | HTML / CSS / Nginx |
| Containerization | Docker |
| Registry | Docker Hub |
| CI/CD | GitHub Actions |
| Orchestration | Kubernetes (k3s) |
| Ingress | Traefik |
| IaC | Terraform + Ansible |
| Monitoring | Prometheus + Grafana |
| DNS & HTTPS | Cloudflare |
| Cloud | DigitalOcean (Frankfurt) |

---

## Phases

- ✅ **Phase 1** — CI/CD Pipeline (GitHub Actions + Docker + DigitalOcean)
- ✅ **Phase 2** — Kubernetes (k3s, 2 replicas, rolling updates, self-healing)
- ✅ **Phase 3** — Infrastructure as Code (Terraform + Ansible)
- ✅ **Phase 4** — Monitoring (Prometheus + Grafana)
- ✅ **Phase 5** — Creative portfolio design
- ✅ **Phase 6** — Domain + HTTPS (Cloudflare + Traefik Ingress)

---

## Project Structure

    DevOps-FullStack-Lab/
    ├── app/
    │   ├── index.html              # Portfolio page
    │   └── style.css               # Styling
    ├── k8s/
    │   ├── deployment.yaml         # Kubernetes deployment (2 replicas)
    │   ├── service.yaml            # NodePort service
    │   ├── ingress.yaml            # Traefik ingress (juliendvstr.dev)
    │   ├── prometheus.yaml         # Prometheus deployment
    │   ├── prometheus-config.yaml  # Prometheus scrape config
    │   ├── grafana.yaml            # Grafana deployment
    │   ├── node-exporter.yaml      # Node metrics exporter
    │   └── kube-state-metrics.yaml # Kubernetes metrics
    ├── terraform/
    │   ├── main.tf                 # DigitalOcean Droplet definition
    │   ├── variables.tf            # Input variables
    │   └── outputs.tf              # Output values
    ├── ansible/
    │   ├── inventory.ini           # Server inventory
    │   └── playbook.yml            # Server configuration playbook
    ├── .github/
    │   └── workflows/
    │       └── ci-cd.yml           # GitHub Actions pipeline
    └── Dockerfile                  # Nginx container

---

## Phase 1 — CI/CD Pipeline

Every push to `main` triggers the GitHub Actions pipeline:

1. Build Docker image from `Dockerfile`
2. Push image to Docker Hub (`judevpro/devops-fullstack-lab:latest`)
3. SSH into DigitalOcean VPS
4. Trigger Kubernetes rolling update with zero downtime

Pipeline file: `.github/workflows/ci-cd.yml`

---

## Phase 2 — Kubernetes

The portfolio runs on a k3s cluster with:

- **2 replicas** — high availability, traffic distributed across pods
- **Self-healing** — crashed pods are automatically restarted
- **Rolling updates** — new versions deployed without downtime
- **Traefik Ingress** — routes juliendvstr.dev to the portfolio service

Deploy manually:

    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service.yaml
    kubectl apply -f k8s/ingress.yaml

Check pods:

    kubectl get pods

---

## Phase 3 — Infrastructure as Code

**Terraform** — describes the DigitalOcean infrastructure as code:

    cd terraform
    terraform init
    terraform plan

**Ansible** — automates server configuration (Docker, k3s, Kubernetes manifests):

    ansible-playbook -i ansible/inventory.ini ansible/playbook.yml --connection=local

If the server is ever destroyed, one command rebuilds the entire configuration from scratch.

---

## Phase 4 — Monitoring

| Tool | URL | Credentials |
|---|---|---|
| Prometheus | http://207.154.247.83:30090 | — |
| Grafana | http://207.154.247.83:30030 | admin / devops2026 |

Prometheus scrapes metrics from:
- `node-exporter` — server CPU, RAM, disk, network
- `kube-state-metrics` — Kubernetes pods and deployments
- `prometheus` — self-monitoring

Grafana dashboard: **Node Exporter Full** (ID: 1860)

---

## Phase 6 — Domain + HTTPS

- Domain `juliendvstr.dev` registered via OVH
- DNS managed by Cloudflare (free plan)
- HTTPS certificate issued automatically by Cloudflare
- Traefik ingress routes HTTP and HTTPS traffic to the portfolio service

---

## Run Locally

    git clone https://github.com/Julien-Dvstr/Devops-FullStack-Lab.git
    cd Devops-FullStack-Lab
    docker build -t devops-fullstack-lab .
    docker run -p 8080:80 devops-fullstack-lab

Open http://localhost:8080

---

## Author

**Julien Devester** — Junior DevOps Engineer  
🌍 [juliendvstr.dev](https://juliendvstr.dev)  
📧 [juliendevesterpro@gmail.com](mailto:juliendevesterpro@gmail.com)  
🔗 [LinkedIn](https://linkedin.com/in/juliendevester) · [GitHub](https://github.com/Julien-Dvstr)
