## Project Documentation: FullStack Blogging App

### Overview
####Jenkins Pipeline
Clean Workspace: Clears the Jenkins workspace. </br>
Git Checkout: Clones the project repository.</br>
Maven Compile & Install: Compiles and installs the project using Maven.</br>
Maven Test: Runs unit tests.</br>
SonarQube Analysis: Performs code quality analysis with SonarQube.</br>
Quality Gate: Ensures the code meets defined quality standards.</br>
Vulnerability Scanning:</br>
OWASP Dependency-Check: Scans project dependencies for vulnerabilities.</br>
Docker Image Scanning: Uses Trivy to scan the Docker image for high and critical vulnerabilities.</br>
OPA Dockerfile Check: Validates the security of the Dockerfile.</br>
Maven Package: Packages the application into a deployable artifact.</br>
Deploy to Nexus: Uploads the artifact to Nexus repository.</br>
Docker Build & Push: Builds the Docker image and pushes it to DockerHub.</br>
Kubernetes Deployment: Deploys the application to a Kubernetes cluster.</br>
Deployment Verification: Checks the status of pods and services in Kubernetes.</br>
