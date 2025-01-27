pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/vijaysam2002/create-react-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-app .'
            }
        }
        stage('Deploy Docker Container') {
            steps {
                sh '''
                docker stop react-app || true
                docker rm react-app || true
                docker run -d -p 80:80 --name react-app react-app
                '''
            }
        }
    }
}

