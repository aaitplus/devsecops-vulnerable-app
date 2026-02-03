# DevSecOps Vulnerable Application Project

[![CI/CD Pipeline](https://github.com/your-username/devsecops-vulnerable-app/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/your-username/devsecops-vulnerable-app/actions/workflows/ci-cd.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive DevSecOps demonstration project featuring OWASP Juice Shop with integrated security practices, container hardening, Kubernetes deployment, and Infrastructure as Code using Terraform.

## 🎯 Project Overview

This project demonstrates enterprise-grade DevSecOps practices by implementing security throughout the entire software development lifecycle. It uses the intentionally vulnerable [OWASP Juice Shop](https://owasp.org/www-project-juice-shop/) application as a training platform to showcase various security controls and best practices.

### Key Features

- 🔒 **Security-First CI/CD** with automated scanning and gates
- 🐳 **Container Hardening** with non-root user and read-only filesystem
- ☸️ **Kubernetes Security** with RBAC, network policies, and security contexts
- 🏗️ **Infrastructure as Code** with cloud-agnostic Terraform (local/example configuration) and security validation
- 🎨 **Modern UI Theme** with cyberpunk purple hacker aesthetic
- 📊 **Comprehensive Monitoring** and security reporting

## 📋 Prerequisites

Before running this project, ensure you have all required tools installed. See [requirements.txt](requirements.txt) for detailed system requirements and installation instructions.

### Minimum Requirements

- **OS:** Linux, macOS, or Windows 10+
- **RAM:** 8GB minimum, 16GB recommended
- **Disk:** 20GB free space
- **Network:** Stable internet connection

### Required Tools

- Git ≥ 2.30.0
- Node.js ≥ 16.0.0 (18.x LTS recommended)
- Docker ≥ 20.10.0
- kubectl ≥ 1.24.0
- Terraform ≥ 1.0.0
- AWS CLI ≥ 2.0.0

### Security Tools (for full DevSecOps experience)

- Trivy ≥ 0.40.0 (Container scanning)
- Semgrep ≥ 1.0.0 (SAST)
- Gitleaks ≥ 8.0.0 (Secret detection)
- OWASP Dependency-Check ≥ 7.0.0
- tfsec ≥ 1.28.0 (IaC security)

## 🚀 Quick Start

### 1. Clone and Setup

```bash
# Clone the repository
git clone https://github.com/aaitplus/devsecops-vulnerable-app.git
cd devsecops-vulnerable-app

# Clone OWASP Juice Shop
cd app
chmod +x clone.sh
./clone.sh
cd ..
```

### 2. Build and Run Locally

```bash
# Build the hardened container
chmod +x scripts/build.sh
./scripts/build.sh

# Run locally
docker run -d -p 3000:3000 --name juice-shop juice-shop:latest

# Apply cyberpunk theme
chmod +x scripts/apply-theme.sh
./scripts/apply-theme.sh
```

### 3. Deploy to Kubernetes

```bash
# Initialize Terraform
cd terraform
terraform init
terraform plan
terraform apply

# Deploy to Kubernetes
cd ..
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

## 📁 Project Structure

```
devsecops-vulnerable-app/
├── app/                          # OWASP Juice Shop source code
│   ├── clone.sh                  # Repository cloning script
│   └── custom-theme.css          # Cyberpunk theme styles
├── docker/                       # Container configurations
│   └── Dockerfile                # Hardened container image
├── k8s/                          # Kubernetes manifests
│   ├── service.yml               # Service configuration
│   ├── networkpolicy.yml         # Network security policies
│   └── rbac.yml                  # Role-based access control
├── terraform/                    # Infrastructure as Code
│   ├── main.tf                   # AWS infrastructure
│   ├── variables.tf              # Configuration variables
│   └── outputs.tf                # Output definitions
├── scripts/                      # Automation scripts
│   ├── build.sh                  # Build automation
│   ├── deploy.sh                 # Deployment automation
│   └── apply-theme.sh            # Theme injection script
├── .github/workflows/            # CI/CD pipelines
│   └── ci-cd.yml                 # GitHub Actions workflow
├── reports/                      # Security scan reports
│   └── README.md                 # Report documentation
├── requirements.txt              # System requirements
├── .gitignore                    # Git ignore rules
└── README.md                     # This file
```

## 🔒 Security Features

### CI/CD Security Pipeline

- **Static Application Security Testing (SAST)** with Semgrep
- **Software Composition Analysis (SCA)** with OWASP Dependency-Check
- **Container Security Scanning** with Trivy
- **Secret Detection** with Gitleaks
- **Infrastructure as Code Security** with tfsec
- **Automated Security Gates** preventing deployment of vulnerable code

### Container Security

- **Non-root user execution** (user: node, uid: 1000)
- **Read-only filesystem** for immutable containers
- **Minimal base image** (node:18-alpine)
- **Security hardening** with proper environment variables
- **Health checks** and resource limits

### Kubernetes Security

- **Security Contexts** with privilege escalation prevention
- **Network Policies** implementing zero-trust networking
- **RBAC** with principle of least privilege
- **Pod Security Standards** enforcement
- **Resource quotas** and limits

### Infrastructure Security

- **Secure VPC configuration** with flow logs
- **Encrypted storage** and communication
- **IAM least privilege** access
- **Security group hardening**
- **Infrastructure scanning** with tfsec

## 🎨 Cyberpunk Theme

The application features a modern purple hacker-style frontend with:

- **Neon purple gradients** and glowing effects
- **Matrix rain animations** and glitch effects
- **Terminal-style elements** and security badges
- **Responsive design** with custom scrollbars
- **Dark cyberpunk aesthetic** for professional demonstrations

## 📊 Security Reports

All security scans generate detailed reports in the `reports/` directory:

- `dependency-check-report.html` - Dependency vulnerabilities
- `trivy-results.sarif` - Container vulnerabilities
- `semgrep.sarif` - Code security issues
- `tfsec-report.json` - Infrastructure security issues

Reports are automatically uploaded to GitHub Security tab for integrated vulnerability management.

## 🧪 Testing

### Local Testing

```bash
# Run security scans locally
trivy fs ./app
semgrep --config p/default ./app
gitleaks detect --verbose --redact --config .gitleaks.toml .

# Test container build
docker build -t juice-shop:test ./docker
trivy image juice-shop:test

# Test Kubernetes manifests
kubectl apply --dry-run=client -f k8s/
```

### CI/CD Testing

The GitHub Actions workflow automatically runs on:
- Push to `main` or `develop` branches
- Pull requests to `main` branch

Monitor the Actions tab for security scan results and deployment status.

## 🚨 Security Considerations

⚠️ **This application contains intentional security vulnerabilities for training purposes only.**

- **Never deploy to production** environments
- **Use only in isolated, controlled environments**
- **Regularly update dependencies** to learn about new vulnerabilities
- **Follow security best practices** when implementing fixes

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow security best practices in all code changes
- Update documentation for any new features
- Ensure all security scans pass before merging
- Test changes in isolated environments

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [OWASP Juice Shop](https://owasp.org/www-project-juice-shop/) - The vulnerable application
- [OWASP](https://owasp.org/) - Security best practices and tools
- [Aqua Security](https://aquasecurity.github.io/) - Trivy and tfsec
- [Semgrep](https://semgrep.dev/) - Code analysis platform
- [GitLeaks](https://github.com/gitleaks/gitleaks) - Secret detection

## 📞 Support

For questions or issues:

1. Check the [troubleshooting guide](#troubleshooting)
2. Review existing [GitHub Issues](https://github.com/your-username/devsecops-vulnerable-app/issues)
3. Create a new issue with detailed information

## 🔧 Troubleshooting

### Common Issues

**Docker build fails:**
```bash
# Check Docker version
docker --version
# Ensure Docker daemon is running
docker info
# Clean up old images
docker system prune -f
```

**Kubernetes deployment fails:**
```bash
# Check cluster connection
kubectl cluster-info
# Verify manifests syntax
kubectl apply --dry-run=client -f k8s/
# Check pod status
kubectl get pods -n default
```

**Terraform issues:**
```bash
# Reinitialize Terraform
terraform init
# Check plan
terraform plan
# Validate configuration
terraform validate
```

**Security scan failures:**
- Review scan output for specific issues
- Update dependencies to fix vulnerabilities
- Check tool versions in requirements.txt

### Debug Mode

Enable verbose logging for troubleshooting:

```bash
# Build script debug
DEBUG=1 ./scripts/build.sh

# Deploy script debug
DEBUG=1 ./scripts/deploy.sh
```

## 📈 Roadmap

- [ ] Multi-cloud support (Azure, GCP)
- [ ] Advanced monitoring with Prometheus/Grafana
- [ ] Automated remediation workflows
- [ ] Integration with security ticketing systems
- [ ] Performance optimization and scaling

---

**⚠️ Disclaimer:** This project is for educational and training purposes only. The vulnerabilities in OWASP Juice Shop are intentional and should not be used in production environments.
