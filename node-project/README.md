🌐 Real-World App: Node.js Web App (e.g., a simple Product Catalog API)
We'll use this app to simulate real-world microservice deployment.

🛠️ DevOps Toolchain We'll Cover (In Sequence)

| Tool           | Purpose                                             |
| -------------- | --------------------------------------------------- |
| **Linux**      | Base OS for all tools and commands                  |
| **Git**        | Source code version control                         |
| **Docker**     | Containerize the app                                |
| **Jenkins**    | Automate build, test, deploy (CI/CD)                |
| **Ansible**    | Provision server + configure (e.g., install Docker) |
| **Terraform**  | Create AWS infrastructure (EC2, S3, EKS, IAM, etc.) |
| **AWS**        | Cloud hosting of app + K8s                          |
| **Kubernetes** | Deploy and scale containerized app                  |
| **Monitoring** | Optional (Prometheus/Grafana)                       |


🧱 Project Architecture:
GitHub Repo → Jenkins → Docker Build → Push to DockerHub
            → Terraform → AWS Infra (EC2 + EKS)
            → Ansible → Install Docker, K8s agents, etc.
            → Kubernetes (EKS) → App Deployment

✅ Step 1: Linux (Ubuntu-based)
If we use Ubuntu throughout on both local (if using VM) and EC2 instances.
🔸 Update OS and install required tools:
sudo apt update && sudo apt upgrade -y
# Basic packages
sudo apt install -y curl git unzip wget vim net-tools gnupg software-properties-comm

# In my case, i'm using alpine linux:
apk add --update nodejs npm.


Step 2: Git (Version Control)
🔸 Create a GitHub repo:
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git clone https://github.com/yourname/devops-node-app.git
cd devops-node-app

🔸 Add Node.js app:
# Example: Express-based app
npm init -y
npm install express
