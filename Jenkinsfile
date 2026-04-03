pipeline {
    agent any
    
    environment {
        
        SONARQUBE_AUTH_TOKEN = credentials('sonar_auth_token')  // Saved SonarQube token in Jenkins credentials
        
    }

    stages {
        stage('SCM Checkout') {
            steps {
                     checkout scm 
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
                
         stage('Make Script Executable') {
            steps {
                script {
                    // Make the script executable
                    sh 'chmod +x ./docker_installation.sh'  
                }
            }
        }

        stage('Run Install Script') {
            steps {
                script {
                    // Run the  script after making it executable
                    sh './docker_installation.sh'  
                }
            }
        }        

		stage('Build Docker Image') {
			    steps {
				script {echo 'Building docker image'
				    // Build the Docker image using the docker-compose file located in the repository

				    sh 'sudo docker compose -f docker-compose.yml build'
                    echo 'Imaga created'
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