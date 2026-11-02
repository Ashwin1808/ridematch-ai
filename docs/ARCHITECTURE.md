# RideMatch AI — Architecture & Engineering Documentation

## 1. System Overview

RideMatch AI is a full-stack vehicle discovery and recommendation platform built using Next.js, Node.js, Express, PostgreSQL, and Google Gemini.

The application separates the presentation layer, backend business logic, persistent data, and external integrations.

## 2. High-Level System Architecture

```mermaid
flowchart TB
    USER(["User / Browser"])

    subgraph APPLICATION["RideMatch AI Application"]
        FE["Next.js 16 Frontend<br/>React"]
        API["Node.js / Express Backend<br/>REST API"]
        DB[("PostgreSQL 16<br/>Vehicle Catalogue & Application Data")]
    end

    subgraph EXTERNAL["External Integrations"]
        GEMINI["Google Gemini API"]
        NEWS["Automotive News API"]
    end

    USER --> FE
    FE -->|"HTTP API Requests"| API
    API -->|"SQL Queries"| DB
    API -->|"AI Recommendation Context"| GEMINI
    API -->|"News Requests"| NEWS
```

## 3. Application Component Architecture

```mermaid
flowchart TD
    subgraph FRONTEND["Frontend — Next.js"]
        HOME["Vehicle Discovery"]
        SEARCH["Search & Filters"]
        RECOMMEND["AI Recommendations"]
        COMPARE["Vehicle Comparison"]
        FAV["Favorites"]
        AUTH["Authentication"]
        CALC["Fuel Calculator"]
        DASH["Dashboard"]
    end

    subgraph BACKEND["Backend — Express"]
        ROUTES["API Routes"]
        AUTH_SERVICE["Authentication Logic"]
        VEHICLE_SERVICE["Vehicle Operations"]
        RECOMMEND_SERVICE["Recommendation Logic"]
        COMPARE_SERVICE["Comparison Logic"]
        NEWS_SERVICE["News Integration"]
    end

    subgraph DATA["Data Layer"]
        POSTGRES[("PostgreSQL")]
    end

    HOME --> ROUTES
    SEARCH --> ROUTES
    RECOMMEND --> ROUTES
    COMPARE --> ROUTES
    FAV --> ROUTES
    AUTH --> ROUTES
    CALC --> ROUTES
    DASH --> ROUTES

    ROUTES --> AUTH_SERVICE
    ROUTES --> VEHICLE_SERVICE
    ROUTES --> RECOMMEND_SERVICE
    ROUTES --> COMPARE_SERVICE
    ROUTES --> NEWS_SERVICE

    AUTH_SERVICE --> POSTGRES
    VEHICLE_SERVICE --> POSTGRES
    RECOMMEND_SERVICE --> POSTGRES
    COMPARE_SERVICE --> POSTGRES
```

## 4. AI Recommendation Workflow

The recommendation engine uses database filtering, deterministic scoring, and Gemini-assisted explanations or candidate re-ranking.

```mermaid
flowchart TD
    A(["User submits preferences"])
    B["Backend receives request"]
    C["SQL filters eligible vehicles"]
    D[("PostgreSQL")]
    E["Return candidate vehicles"]
    F["Apply deterministic scoring"]
    G["Send candidate context to Gemini"]
    H{"Is AI response valid?"}
    I["Validate returned candidate IDs"]
    J["Use deterministic fallback"]
    K["Prepare recommendations"]
    L(["Return results to frontend"])

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
    H -->|"Yes"| I
    H -->|"No"| J
    I --> K
    J --> K
    K --> L
```

### Recommendation scoring model

| Preference | Weight |
|---|---:|
| Budget | 40 |
| Fuel type | 20 |
| Transmission | 15 |
| Body type | 15 |
| Seating capacity | 10 |
| **Total** | **100** |

The backend filters candidates before AI processing. Gemini does not independently create vehicle records.

## 5. Container Architecture

The application uses Docker to package the frontend and backend. Docker Compose coordinates the application containers and PostgreSQL.

```mermaid
flowchart TB
    COMPOSE["Docker Compose"]

    subgraph CONTAINERS["Application Containers"]
        FRONT["Frontend Container<br/>Next.js"]
        BACK["Backend Container<br/>Node.js / Express"]
        POSTGRES[("PostgreSQL Container")]
    end

    BROWSER(["Browser"]) --> FRONT
    FRONT -->|"API Requests"| BACK
    BACK -->|"Database Connection"| POSTGRES

    COMPOSE -.-> FRONT
    COMPOSE -.-> BACK
    COMPOSE -.-> POSTGRES
```

## 6. CI/CD Pipeline

The repository contains GitHub Actions workflows for building, validating, scanning, publishing images, and deploying to an EC2 host.

```mermaid
flowchart TD
    A(["Developer pushes code"])
    B["GitHub Actions CI"]
    C["Build frontend and backend"]
    D["Terraform format and validation"]
    E["Build Docker images"]
    F["Trivy image scanning"]
    G["Publish container images"]
    H["SonarCloud analysis"]
    I["Deployment workflow"]
    J["Connect to EC2"]
    K["Pull latest application changes"]
    L["Docker Compose pull and up"]
    M(["Application deployment"])

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
    H --> I
    I --> J
    J --> K
    K --> L
    L --> M
```

**Important:** This diagram represents the configured workflow. It does not imply automated application tests or independently verified production deployment.

## 7. AWS Infrastructure Architecture

Terraform configuration describes the intended AWS infrastructure.

```mermaid
flowchart TB
    INTERNET(["Internet"])

    subgraph AWS["AWS Environment"]
        ALB["Application Load Balancer"]

        subgraph VPC["VPC"]
            IGW["Internet Gateway"]
            NAT["NAT Gateway"]

            subgraph PUBLIC["Public Subnets"]
                ALB
                NAT
            end

            subgraph PRIVATE["Private Subnets"]
                ASG["EC2 Auto Scaling Group"]
                EC2["EC2 Application Instances"]
            end
        end

        IAM["IAM Roles and Policies"]
        CW["CloudWatch Configuration"]
    end

    INTERNET --> ALB
    ALB --> EC2
    EC2 --> ASG
    ASG --> IAM
    ASG --> CW
    EC2 --> NAT
    NAT --> IGW
```

**Implementation status:** Terraform source configuration is present and has validation evidence. This diagram describes the intended architecture, not a currently verified Terraform-managed production environment.

## 8. Kubernetes Architecture — Planned / Under Development

The repository contains Kubernetes manifests and Helm templates. The chart has outstanding issues and is not currently claimed as a verified, installable deployment.

```mermaid
flowchart TB
    USER(["User"])
    INGRESS["NGINX Ingress"]
    FRONT["Frontend Service"]
    BACK["Backend Service"]
    FRONT_POD["Frontend Pods"]
    BACK_POD["Backend Pods"]
    DB["PostgreSQL Workload"]

    USER --> INGRESS
    INGRESS --> FRONT
    INGRESS --> BACK
    FRONT --> FRONT_POD
    BACK --> BACK_POD
    BACK_POD --> DB
```

This is a conceptual target architecture, not a representation of a verified running Kubernetes cluster.

## 9. Observability Architecture — Planned / Under Development

The repository includes monitoring-related configuration, but the complete monitoring stack has not been verified as deployed.

```mermaid
flowchart TD
    APP["RideMatch AI Application"]
    METRICS["Application Metrics"]
    PROM["Prometheus"]
    GRAFANA["Grafana Dashboards"]
    LOGS["Application Logs"]
    LOKI["Loki"]
    ALERT["Alertmanager"]

    APP --> METRICS
    METRICS --> PROM
    PROM --> GRAFANA
    PROM --> ALERT
    APP --> LOGS
    LOGS --> LOKI
    LOKI --> GRAFANA
```

## 10. Technology Stack

| Layer | Technology |
|---|---|
| Frontend | Next.js 16, React |
| Backend | Node.js, Express |
| Database | PostgreSQL 16 |
| AI integration | Google Gemini |
| Authentication | JWT |
| Containers | Docker, Docker Compose |
| CI/CD | GitHub Actions |
| Cloud | AWS |
| Infrastructure as Code | Terraform |
| Image scanning | Trivy |
| Code quality | SonarCloud |
| Orchestration configuration | Kubernetes, Helm |
| Monitoring configuration | Prometheus, Grafana, Loki, Alertmanager |

## 11. Engineering Improvements

- Implement automated backend and frontend tests.
- Strengthen CI security gates.
- Improve deployment verification and rollback.
- Complete Kubernetes and Helm validation.
- Deploy monitoring components end to end.
- Improve user-specific data isolation.
- Integrate a verified live fuel-price provider.
- Improve application observability and operational alerts.

## 12. Documentation Status

This document distinguishes between implemented application functionality, tested workflows, infrastructure configuration, and planned or incomplete deployment components.

The presence of a configuration file alone does not establish that a service is deployed or operational.
