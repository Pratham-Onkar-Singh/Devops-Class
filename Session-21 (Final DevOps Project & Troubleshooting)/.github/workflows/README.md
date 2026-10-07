# GitHub Actions workflow

The final pipeline has three gated stages:

1. `ci-security`: install, test, Bandit SAST, pip-audit SCA, and Gitleaks secret scanning.
2. `image`: build the Docker image, scan it with Trivy, and push only after the gate passes.
3. `deploy`: apply Kubernetes manifests only when the repository has a `KUBE_CONFIG` secret.

The GHCR image name is lowercase to satisfy registry naming rules. The workflow never stores AWS keys or Kubernetes credentials in source control.
