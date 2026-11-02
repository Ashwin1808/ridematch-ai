# LinkedIn Post

## Main post

I built RideMatch AI - a full-stack, AI-powered vehicle discovery platform.

The idea: you should not need 12 browser tabs to answer "Which car should I buy?"

You enter your budget, fuel/transmission/body preferences, seating needs, driving pattern, and a plain-English prompt. RideMatch AI filters a PostgreSQL catalogue of 1,284 vehicles, scores the candidates, and uses Gemini 2.5 Flash to explain the top matches.

What is inside:

- AI recommendations built from SQL filtering, weighted scoring, and Gemini explanations
- A vehicle garage with search, filters, sorting, pagination, and favorites
- Detail pages with AI pros/cons, reviews, similar vehicles, and running-cost estimates
- Side-by-side comparison for up to five vehicles
- JWT authentication with bcrypt password hashing
- Automotive news through the GNews API

The part I enjoyed most was the DevOps side:

- Multi-stage Docker builds with non-root runtime users
- GitHub Actions CI: build, Trivy image scan, SonarCloud analysis, Docker Hub push
- An EC2 deployment workflow after a green pipeline
- Terraform definitions for AWS VPC, subnets, ALB, Auto Scaling Group, IAM, and CloudWatch
- Kubernetes/Helm manifests with health probes, HPA, NetworkPolicy, Prometheus ServiceMonitor templates, and alert rules

One design decision I would repeat: the LLM is not allowed to invent vehicles. It can only rank and explain IDs returned by the database. If Gemini returns invalid JSON, the API falls back to the deterministic top three. AI should improve the experience, not become a single point of failure.

Repo: https://github.com/Ashwin1808/ridematch-ai

If you are building AI products or preparing for full-stack/DevOps roles, I would love feedback on the architecture or the deployment approach.

#FullStackDevelopment #AI #Nextjs #Nodejs #PostgreSQL #GoogleGemini #Docker #Kubernetes #Terraform #AWS #DevOps #GitHubActions

---

## Shorter version

I built RideMatch AI - an AI-powered vehicle discovery platform that turns a budget and a few preferences into an explained shortlist.

The flow is simple: SQL filters the catalogue, a weighted scoring model ranks the candidates, and Gemini 2.5 Flash explains the best matches. The model can only choose from real database IDs. If its JSON response breaks, the API falls back to the deterministic top three.

It also includes a searchable vehicle garage, detailed spec pages with AI pros/cons, a five-vehicle comparison view, favorites, JWT auth, automotive news, and running-cost estimates.

On the delivery side, I used multi-stage Docker builds, GitHub Actions with Trivy and SonarCloud, an EC2 deployment workflow, Terraform AWS definitions, and Kubernetes/Helm manifests with HPA and Prometheus monitoring configuration.

Repo: https://github.com/Ashwin1808/ridematch-ai

I am looking for feedback on the architecture, the AI fallback strategy, and the deployment setup.

#FullStackDevelopment #AI #Nextjs #Nodejs #PostgreSQL #Docker #Kubernetes #Terraform #AWS #DevOps

---

## Optional first comment

Stack details: Next.js 16 + React 19 + Tailwind CSS 4 on the frontend; Express 5 + PostgreSQL 16 on the backend; Gemini 2.5 Flash for recommendations and vehicle analysis; GitHub Actions + Trivy + SonarCloud for CI; Terraform AWS definitions; Helm manifests plus Prometheus monitoring configuration.

---

## Posting notes

- Attach a product screenshot or a short screen recording. The strongest visual is the home page form next to the recommendation results.
- If you attach the architecture diagram, use a PNG export from the Mermaid block in the README for better mobile readability.
- Keep the GitHub link in the post body and repeat it in the first comment only if LinkedIn limits reach.
- Replace "I would love feedback" with a specific question if you want more comments, for example: "Would you keep the LLM as an explainer layer, or let it generate the final ranking?"
