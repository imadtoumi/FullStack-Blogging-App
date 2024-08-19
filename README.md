## Project Documentation: FullStack Blogging App

### Overview
####Jenkins Pipeline
Clean Workspace: Clears the Jenkins workspace.
Git Checkout: Clones the project repository.
Maven Compile & Install: Compiles and installs the project using Maven.
Maven Test: Runs unit tests.
SonarQube Analysis: Performs code quality analysis with SonarQube.
Quality Gate: Ensures the code meets defined quality standards.
Vulnerability Scanning:
OWASP Dependency-Check: Scans project dependencies for vulnerabilities.
Docker Image Scanning: Uses Trivy to scan the Docker image for high and critical vulnerabilities.
OPA Dockerfile Check: Validates the security of the Dockerfile.
Maven Package: Packages the application into a deployable artifact.
Deploy to Nexus: Uploads the artifact to Nexus repository.
Docker Build & Push: Builds the Docker image and pushes it to DockerHub.
Kubernetes Deployment: Deploys the application to a Kubernetes cluster.
Deployment Verification: Checks the status of pods and services in Kubernetes.
