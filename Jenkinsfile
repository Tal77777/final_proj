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
                sh 'docker build -t devopscloudbootcamp/webapp:$BUILD_NUMBER .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push devopscloudbootcamp/webapp:$BUILD_NUMBER'
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                docker stop webapp_ctr || true
                docker run --rm -d -p 3000:3000 --name webapp_ctr devopscloudbootcamp/webapp:${BUILD_NUMBER}
                '''
            }
        }
    }
}
