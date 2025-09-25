InnovateMart EKS Deployment - Project Bedrock

## Architecture Overview
- **VPC**: Multi-AZ setup with public/private subnets in eu-west-1
- **EKS Cluster**: Managed Kubernetes control plane with t3.micro worker nodes
- **Application**: Google Cloud Platform microservices-demo (Online Boutique)
- **Security**: IAM roles, RBAC, read-only developer - **CI/CD**: GitHub Actions pipeline for Terraform automation

## Access Instructions

### Application Access
```bash
kubectl port-forward service/frontend 8080:80
Visit: http://localhost:8080

Developer Read-Only Access
IAM User: innovatemart-developer
Keys in PDF

Configuration:

bash
aws configure --profile developer
# Use credentials above, region: eu-west-1
aws eks update-kubeconfig --region eu-west-1 --name innovatemart-eks --profile developer
kubectl get pods  # Verify read-only access
Infrastructure Details
Cluster Name: innovatemart-eks

Region: eu-west-1

Node Group: t3.micro instances (Free Tier optimized)

Networking: VPC with NAT Gateway, private node isolation

Core Requirements Met ✅
3.1 Infrastructure as Code
Terraform-provisioned VPC with public/private subnets

EKS cluster with managed node groups

IAM roles with least privilege

3.2 Application Deployment
Full microservices-demo application deployed

In-cluster dependencies (Redis, etc.)

All services running and accessible

3.3 Developer Access
IAM user innovatemart-developer created

Kubernetes RBAC configured for read-only access

Access tested and verified

3.4 CI/CD Automation
GitHub Actions pipeline implemented

Terraform plan on PRs, apply on main branch

Secure credential management via GitHub Secrets

File Structure
text
├── terraform/           # Infrastructure as Code
├── microservices-demo/  # Application code
├── .github/workflows/   # CI/CD pipelines
├── cluster-autoscaler.yaml
├── developer-rbac.yaml
└── README.md
Quick Start
terraform init && terraform apply

kubectl apply -f microservices-demo/release/kubernetes-manifests.yaml

kubectl port-forward service/frontend 8080:80

EKS cluster with managed node groups

IAM roles with least privilege
