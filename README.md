## Project Documentation: FullStack Blogging App

### Overview
####Jenkins Pipeline
1. Clean Workspace: Clears the Jenkins workspace. </br>
2. Git Checkout: Clones the project repository.</br>
3. Maven Compile & Install: Compiles and installs the project using Maven.</br>
4. Maven Test: Runs unit tests.</br>
5. SonarQube Analysis: Performs code quality analysis with SonarQube.</br>
6. Quality Gate: Ensures the code meets defined quality standards.</br>
7. vulnerability Scanning:</br>
8. OWASP Dependency-Check: Scans project dependencies for vulnerabilities.</br>
9. Docker Image Scanning: Uses Trivy to scan the Docker image for high and critical vulnerabilities.</br>
10. OPA Dockerfile Check: Validates the security of the Dockerfile.</br>
11. Maven Package: Packages the application into a deployable artifact.</br>
12. Deploy to Nexus: Uploads the artifact to Nexus repository.</br>
13. Docker Build & Push: Builds the Docker image and pushes it to DockerHub.</br>
14. Kubernetes Deployment: Deploys the application to a Kubernetes cluster.</br>
15. Deployment Verification: Checks the status of pods and services in Kubernetes.</br>
