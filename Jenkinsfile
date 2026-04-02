pipeline {
    agent any
    
    environment {
        
        SONARQUBE_AUTH_TOKEN = credentials('sonar_auth_token')  // saved SonarQube token in Jenkins credentials
        
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/fatimalatif-dev/ecommerce-dev-hub.git'
            }
        }

        stage('Run Sonarqube') {
            environment {
                scannerHome = tool 'sonarqube_tool';
            }
            steps {
              withSonarQubeEnv(credentialsId: 'sonar_auth_token', installationName: 'sonarqube_server') {
                sh "${scannerHome}/bin/sonar-scanner"
              }
            }
        }
    }
    
    post {
        always {
            cleanWs()  // Clean workspace after the pipeline
        }
        success {
            echo 'SonarQube analysis completed successfully!'
        }
        failure {
            echo 'SonarQube analysis failed!'
        }
    }
}