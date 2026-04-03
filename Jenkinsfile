pipeline {
    agent any
    
    environment {
        
        SONARQUBE_AUTH_TOKEN = credentials('sonar_auth_token')  // Saved SonarQube token in Jenkins credentials
        
    }

    stages {
        stage('SCM Checkout') {
            steps {
                // git branch: 'dev', url: 'https://github.com/fatimalatif-dev/ecommerce-dev-hub.git'
                checkout scm 
            }
        }

        // stage('Run Sonarqube') {
        //     environment {
        //         scannerHome = tool 'sonarqube_tool';
        //     }
        //     steps {
        //       withSonarQubeEnv(credentialsId: 'sonar_auth_token', installationName: 'sonarqube_server') {
        //         sh "${scannerHome}/bin/sonar-scanner"
        //       }
        //     }
        // }
                
         stage('Make Script Executable') {
            steps {
                script {
                    // Make the install.sh script executable
                    sh 'chmod +x ./docker_installation.sh'  // Adjust the path if needed
                }
            }
        }

        stage('Run Install Script') {
            steps {
                script {
                    // Run the install script after making it executable
                    sh './docker_installation.sh'  // Adjust the path if needed
                }
            }
        }        


  
		stage('Build Docker Image') {
			    steps {
				script {echo 'Building docker image'
				    // Build the Docker image using the docker-compose file located in the repository

				    sh 'docker compose -f docker-compose.yml build --progress=plan'
                    echo 'listing the docker images'
                    sh 'docker image ls'
                    
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