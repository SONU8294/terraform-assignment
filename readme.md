# Flask + Express AWS Deployment (Terraform)

---

## Project overview

This repository contains Terraform configurations and application code to deploy:

- **Part 1** – Both Flask (port 5000) and Express (port 3000) on a single EC2 instance.
- **Part 2** – Flask and Express each on separate EC2 instances.
- **Part 3** – Dockerized apps deployed with ECR + ECS (Fargate) behind an ALB.

It includes Terraform files for VPC, subnets, security groups, ECR, ECS, task definitions, services, ALB and listener rules.

---

