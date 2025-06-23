# 🌐 Terraform AWS VPC Infrastructure

This project uses **Terraform** to provision a complete AWS VPC setup with public and private subnets, NAT gateways, EC2 instances, and NGINX deployment. It follows real-world infrastructure patterns and demonstrates secure networking, automation, and modular IaC practices.

---

## ✅ Project Overview

- Provisioned AWS **VPC** with proper CIDR configuration
- Created **2 Public** and **2 Private Subnets** across different Availability Zones
- Configured **Route Tables**, **Internet Gateway**, and **NAT Gateways**
- Launched **4 EC2 Instances**:
  - 2 in Public Subnets
  - 2 in Private Subnets
- Installed and verified **NGINX** on all servers
- Enabled **internet access** for public instances
- Set up **SSH access** from public to private instances
- Verified **private NGINX servers** via internal access

---

## 🧠 Architecture Diagram

![aws_vpc](https://github.com/user-attachments/assets/b81b8b5b-5b2f-43da-9175-8bd1f1154c23)



---

## 🧱 Resources Created

### Networking
- VPC
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- 2 NAT Gateways (one in each AZ)
- Route Tables and associations

### Compute
- 2 EC2 instances in Public Subnets (NGINX installed)
- 2 EC2 instances in Private Subnets (NGINX installed)

### Security & Access
- SSH access enabled from public to private instances
- HTTP (port 80) allowed for NGINX access
- Security Groups configured per best practices

---

## 🌍 Access & Testing

- Public EC2 Instances:
  - Accessible via public IP
  - NGINX web server accessible via browser
- Private EC2 Instances:
  - Not publicly accessible
  - Verified by SSH into public instance, then curl to private instance IP

---

## 🗂️ Project Structure

terraform-infra-pro/
├── modules/
│   ├── vpc/                         # Creates the custom VPC with CIDR block
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/                         # Launches EC2 instances in public and private subnets
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security-groups/            # Defines and manages security groups for EC2 and subnets
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── networking/                 # Sets up subnets, route tables, IGW, NAT gateways
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── userdata.sh
│   ├── non-prod/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── userdata.sh
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── userdata.sh
└── README.md                        # Project documentation
