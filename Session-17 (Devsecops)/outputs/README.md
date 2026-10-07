# DevSecOps evidence outputs

The workflow uploads test, SAST, SCA, secret-scan, image-scan, application, and deployment evidence as downloadable artifacts. This directory documents the expected evidence names for the successful run.

| Artifact | Evidence |
|---|---|
| `session17-security-reports` | JUnit, Bandit, pip-audit, Gitleaks, and Trivy reports |
| `session17-application` | Application source and runtime requirements |
| `session17-deployment` | Deployment response and port-forward log |
