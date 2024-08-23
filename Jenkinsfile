pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'JK-DevSecOps', url: 'https://github.com/Tal77777/final_proj.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t tal7777/webapp:$BUILD_NUMBER .'
            }
        }
    }
}
