
# Terraform EKS Cluster Deployment

A Terraform-based infrastructure module to provision and manage an **Amazon EKS (Elastic Kubernetes Service) cluster**, including its VPC, node groups, and supporting AWS resources.

---

## 🚀 Project Overview

This repo defines a Terraform configuration to deploy:

- A VPC (optional; customizable)
- An EKS control plane cluster
- Node groups using either **Managed Node Groups** or **Self-Managed**
- IAM roles, security groups, and networking components
- Optional Kubernetes addons via Terraform

Ideal for bootstrapping production-ready Kubernetes clusters on AWS.

---

### 📦 Repository Structure

```
.
├── main.tf               # Root configuration and module instantiation
├── variables.tf          # Input variables and defaults
├── outputs.tf            # Terraform outputs (e.g. cluster endpoint, node group ARNs)
├── modules/              # Reusable modules (EKS cluster, VPC, node groups)
│   ├── eks/
│   └── vpc/
├── examples/             # Sample usage scenarios
└── README.md             # This documentation file
```

---

## 🔧 Prerequisites

- Terraform **v1.5+**
- AWS Provider plugin **v6+**
- AWS credentials configured via:
  - `~/.aws/credentials`
  - Environment variables
  - IAM role (if running from EC2/CloudShell/etc.)

---

## ⚙️ How to Use

1. **Clone the repo**:

  ```
   git clone https://github.com/pattabi95/terraform-eks.git
   cd terraform-eks
```
2. Update inputs in terraform.tfvars or variables.tf:

  - AWS region
  - VPC and subnet IDs (if using an existing VPC)
  - Kubernetes version (e.g. "1.28")
  - Node group settings (instance types, autoscaling limits, etc.)

3. Initialize Terraform:
 ```
 terraform init
```

4. Apply the configuration:
 ```
 terraform apply
```
----

🔄 Outputs
On successful deployment, Terraform will output:

| Output Name                   | Description                                  |
| ----------------------------- | -------------------------------------------- |
| `cluster_endpoint`            | Kubernetes API server endpoint               |
| `cluster_security_group_id`   | Security group associated with control plane |
| `node_group_cluster_role_arn` | IAM role ARN used by node group(s)           |
| `cluster_name`                | Name of the EKS cluster                      |


Outputs are defined in outputs.tf.

---

🗑️ Cleaning Up
To destroy all provisioned resources:
```
 terraform destroy
```
This will delete the EKS cluster, node groups, IAM roles, and any managed infrastructure.

---
📄 License
This project is licensed under the Apache‑2.0 License. See the LICENSE file for details.

---

✅ Summary
This Terraform setup helps you:

  - Provision scalable, production-grade EKS clusters

  - Customize networking, scaling, and cluster configuration easily

  - Reuse modular infrastructure for consistent cloud deployments
