# Security Scan Reports

This directory contains security scan reports and findings from various security tools used in the DevSecOps pipeline.

## Report Types

### SAST (Static Application Security Testing)
- **Semgrep**: Code analysis for security vulnerabilities
- **Location**: Generated during CI/CD pipeline
- **Format**: SARIF (uploaded to GitHub Security tab)

### Dependency Scanning
- **OWASP Dependency-Check**: Scans for vulnerable dependencies
- **Location**: `dependency-check-report.html`
- **Format**: HTML report with detailed findings

### Container Security
- **Trivy**: Vulnerability scanning for containers and filesystem
- **Location**: `trivy-results.sarif` and `trivy-image-results.sarif`
- **Format**: SARIF (uploaded to GitHub Security tab)

### Secret Scanning
- **Gitleaks**: Scans for hardcoded secrets and credentials
- **Location**: Generated during CI/CD pipeline
- **Format**: GitHub Security tab alerts

### Infrastructure as Code Security
- **tfsec**: Security scanning for Terraform configurations
- **Location**: `tfsec-report.json`
- **Format**: JSON with detailed security issues

## Example Report Structure

```
reports/
├── dependency-check-report.html
├── tfsec-report.json
├── semgrep.sarif
├── trivy-results.sarif
└── trivy-image-results.sarif
```

## Viewing Reports

1. **GitHub Security Tab**: Most SARIF reports are automatically uploaded to GitHub's security tab
2. **Local Viewing**: HTML reports can be opened in any web browser
3. **JSON Reports**: Can be viewed with any JSON viewer or processed programmatically

## Remediation Guidelines

- Review all HIGH and CRITICAL severity findings
- Update dependencies to patched versions
- Implement security best practices in code
- Harden container configurations
- Fix infrastructure security misconfigurations

## Note

These reports are generated automatically during the CI/CD pipeline. For local testing, run the security tools manually or use the provided scripts.
