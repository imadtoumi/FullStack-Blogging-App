pipeline {
    agent any
    
    tools {
        jdk 'jdk17'
        maven 'maven3'
    }
    
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Clean workspace'){
            steps{
                cleanWs()
            }
        }
        
        stage('Git checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/imadtoumi/FullStack-Blogging-App.git'
            }
        }
        
        stage('maven compile') {
            steps {
                sh 'mvn clean compile'
            }
        }
        
        stage('maven install') {
            steps {
                sh 'mvn install'
            }
        }
        
        stage('maven test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Sonar analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Blogging-app \
                    -Dsonar.projectKey=Blogging-app -Dsonar.java.binaries=target -Dsonar.exclusions=dependency_check.html'''
                }
            }
        }
        
        stage('Sonar Qauality Gate') {
            steps {
                waitForQualityGate abortPipeline: true, credentialsId: 'sonar-token'
            }
        }
        
        stage('Vulnerabilties scaning') {
            steps {
                parallel(
                    'Dependency checking':{
                        dependencyCheck additionalArguments: '--scan ./ --format XML --out dependency_check.xml ', odcInstallation: 'owasp'
                        dependencyCheckPublisher pattern: 'dependency_check.xml'
                        archiveArtifacts artifacts: 'dependency_check.xml', allowEmptyArchive: false
                    },'Docker base image scaning':{
                        sh 'bash scan-BaseImage.sh'
                    },'OPA - Docker file':{
                        sh 'docker run --rm -v $(pwd):/project openpolicyagent/conftest test --policy dockerfile-security.rego Dockerfile'
                    }
                )
            }
        }
        
        stage('Maven Package') {
            steps {
                sh 'mvn package'
            }
        }
        
        stage('Maven deploy artifacts to Nexus') {
            steps {
                withMaven(globalMavenSettingsConfig: 'Maven-settings', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
                    sh 'mvn deploy'
                }
            }
        }
        
        stage('Docker build image') {
            steps {
                sh 'docker build -t imadtoumi/fullstack-blogging-app:latest .'
            }
        }
        
        stage('Docker push to DockerHub') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        sh 'docker push imadtoumi/fullstack-blogging-app:latest'
                    }
                }
            }
        }
        
        stage('kubectl create pod') {
            steps {
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8s-cred', namespace: 'blogging-app', serverUrl: 'https://172.31.0.196:6443']]) {
                    sh 'kubectl apply -f deployment-service.yml'
                    sleep 10
                }
            }
        }
        
        stage('check deployment / svc') {
            steps {
                withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8s-cred', namespace: 'blogging-app', serverUrl: 'https://172.31.0.196:6443']]) {
                    sh 'kubectl get pods,svc'
                }
            }
        }
        // stage('Git checkout') {
        //     steps {
                
        //     }
        // }
        
    }
}
