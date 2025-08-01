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


✅ Step 3: Docker (Containerize the App)
#write a Dockerfile
# Build & run:
docker build -t devops-node-app .
docker images
docker run -d -p 3000:3000 --name my devops-node-app
docker ps 
#if container is not running, try docker ps --all
if it exists but status is Exited(1) then 
debug by using:
docker log my
🔸 Test: curl http://localhost:3000

🔸 Push to DockerHub:
docker tag devops-node-app yourdockerhubuser/devops-node-app:latest
docker login

https://login.docker.com/activate

docker push yourdockerhubuser/devops-node-app:latest


✅ Step 4. ✅ Step 4: Jenkins (CI/CD Automation)
🔸 Install Jenkins:
sudo apt update
sudo apt install -y openjdk-11-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
🔸 Start & Access Jenkins:

sudo systemctl start jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
----------------------------------------------------
# in my case, running jenkins inside docker
Run Jenkins container
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts

# Get Jenkins admin password
# You’ll need the initial admin password to unlock Jenkins UI. Run:
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
-------------------------------------------------------------------
🔸 Create a Pipeline Job:
SCM: Git
Jenkinsfile:

