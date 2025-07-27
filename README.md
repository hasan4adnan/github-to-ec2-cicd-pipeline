# 🚀 GitHub to EC2 CI/CD Pipeline with AWS

This project demonstrates a **complete CI/CD pipeline** using AWS services like **CodePipeline, CodeBuild, CodeDeploy**, and **EC2**. It automatically builds and deploys a Node.js application to EC2 instances when changes are pushed to the GitHub repository.

> ✅ Infrastructure is provisioned using **Terraform** for full automation and reproducibility.

---

## 📌 Architecture Overview

GitHub → AWS CodePipeline → CodeBuild → Manual Approval → CodeDeploy → EC2

### 🛠️ Services Used:
- **GitHub** – Source control and trigger for pipeline
- **AWS CodePipeline** – Orchestration of the full CI/CD flow
- **AWS CodeBuild** – Builds the Node.js project
- **AWS CodeDeploy** – Handles deployment to EC2
- **Amazon EC2** – Hosting the deployed application
- **Terraform** – Infrastructure as Code (IaC) for provisioning

---

## 🧱 Project Structure

```
.
├── app/                    # Node.js application
├── scripts/                # Deployment lifecycle scripts
│   ├── install_dependencies.sh
│   ├── start_server.sh
│   └── health_check.sh
├── appspec.yml            # CodeDeploy instructions
├── buildspec.yml          # CodeBuild instructions
├── ci-cd-to-ec2/          # Infrastructure provisioning
│   ├── ec2.tf
│   ├── iam.tf
│   ├── codepipeline.tf
│   ├── codedeploy.tf
│   ├── codebuild.tf
│   └── main.tf
└── README.md
```

---

## ⚙️ Deployment Lifecycle

1. **Push Code to GitHub**
   - Triggers CodePipeline

2. **Build Stage**
   - CodeBuild uses `buildspec.yml` to:
     - Install dependencies
     - Run tests (optional)
     - Package and upload artifact to S3

3. **Manual Approval**
   - Controlled deployment (optional in pipeline)

4. **Deploy Stage**
   - CodeDeploy uses `appspec.yml` and `scripts/` to:
     - Stop the previous app
     - Install the new version
     - Start the app

---

## 📄 appspec.yml

```yaml
version: 0.0
os: linux
files:
  - source: /
    destination: /home/ec2-user/app
hooks:
  BeforeInstall:
    - location: scripts/stop_server.sh
      timeout: 60
  AfterInstall:
    - location: scripts/install_dependencies.sh
      timeout: 60
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 60
```

## 📦 buildspec.yml

```yaml
version: 0.2
phases:
  install:
    runtime-versions:
      nodejs: 14
    commands:
      - echo Installing dependencies...
      - npm install
  build:
    commands:
      - echo Build completed successfully.
artifacts:
  files:
    - '**/*'
```

---

## 📌 How to Use This Project

### 🧾 Prerequisites
- AWS CLI configured
- Git & GitHub account
- Terraform installed
- Valid EC2 key pair (e.g., cicddeploy.pem)

### ✅ Steps

1. **Clone the repo:**
   ```bash
   git clone https://github.com/hasan4adnan/github-to-ec2-cicd-pipeline.git
   ```

2. **Navigate into project:**
   ```bash
   cd github-to-ec2-cicd-pipeline/ci-cd-to-ec2
   ```

3. **Deploy infrastructure with Terraform:**
   ```bash
   terraform init
   terraform apply
   ```

4. **Push code to GitHub main branch:**
   ```bash
   git push origin main
   ```

5. **Watch deployment flow** in AWS Console under CodePipeline and CodeDeploy.

---

## 📸 Screenshots

Add screenshots of your pipeline stages or deployment success screen here.

---

## 🙋‍♂️ Author

**Hasan Adnan**
- 📫 GitHub: [hasan4adnan](https://github.com/hasan4adnan)

---

## 🏷️ License

This project is licensed under the MIT License.