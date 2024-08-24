pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('JK-DevSecOps')
    }

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'JK-DevSecOps', url: 'https://github.com/Tal77777/final_proj.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t tal7777/stock-news:$BUILD_NUMBER .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push tal7777/stock-news:$BUILD_NUMBER'
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                docker stop webapp_ctr || true
                docker run --rm -d -p 3000:3000 --name webapp_ctr tal7777/stock-news:$BUILD_NUMBER
                '''
            }
        }
    }
}
