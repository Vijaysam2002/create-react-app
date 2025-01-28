pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-react:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull the code from your Git repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop any existing container and run the new container
                    sh 'docker ps -q --filter "name=react-app" | xargs -r docker stop'
                    sh 'docker ps -q --filter "name=react-app" | xargs -r docker rm'
                    sh 'docker run -d -p 4000:4000 --name react-app ${DOCKER_IMAGE}'
                }
            }
        }

        stage('Cleanup Docker Images') {
            steps {
                script {
                    // Clean up unused Docker images
                    sh 'docker image prune -f'
                }
            }
        }
    }
    
    post {
        always {
            // Clean up containers even if the build fails
            sh 'docker ps -q --filter "name=react-app" | xargs -r docker stop'
            sh 'docker ps -q --filter "name=react-app" | xargs -r docker rm'
        }
    }
}

