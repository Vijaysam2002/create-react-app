pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'react-app:latest'  // Use a local name here
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vijaysam2002/create-react-app.git'  // Replace with your Git repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    sh """
                    ssh -o StrictHostKeyChecking=no user@your_server_ip '
                        docker stop react-app-container || true &&
                        docker rm react-app-container || true &&
                        docker run -d --name react-app-container -p 4000:4000 $DOCKER_IMAGE
                    '
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}

