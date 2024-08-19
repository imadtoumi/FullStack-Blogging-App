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
</br></br>

![blueoceoan](https://github.com/user-attachments/assets/af3d9486-9218-41b0-a5a2-e99f767188b0)</br>
![nexus](https://github.com/user-attachments/assets/4355db80-b07d-42bf-add9-6fbe375d0cb4)</br>
![sonar](https://github.com/user-attachments/assets/f7ac1655-bd23-479e-89b8-b5c5ca154f9e)</br>
![deployment-k8s](https://github.com/user-attachments/assets/bd058952-b40d-42aa-830c-671cbfc4db90)</br>
