pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "tal7777/stock-news-app"
        DOCKERHUB_CREDENTIALS = credentials('JK-DevSecOps')
        GIT_REPO_URL = 'https://github.com/Tal77777/final_proj.git'
        GIT_CREDENTIALS_ID = 'JK-DevSecOps'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout the repository
                    echo "Checking out the repository from branch: main"
                    git branch: 'main', credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL
                    
                    // Clean up any previous images
                    echo 'Cleaning up old Docker images...'
                    sh "docker rmi ${DOCKER_IMAGE}:${BUILD_NUMBER} || true"

                    // Build the Docker image
                    echo 'Building the Docker image...'
                    sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Docker login to Docker Hub
                    echo 'Logging in to Docker Hub...'
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'

                    // Push Docker image to Docker Hub
                    echo 'Pushing the Docker image to Docker Hub...'
                    sh "docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Clean up any running container with the same name
                    echo 'Stopping and removing old containers...'
                    sh '''
                    docker stop webapp_ctr || true
                    docker rm webapp_ctr || true
                    '''
                    
                    // Deploy the application
                    echo 'Deploying the application...'
                    sh '''
                    docker run --rm -d -p 3000:3000 --name webapp_ctr ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
        success {
            echo "Build succeeded: ${env.JOB_NAME} for branch: ${env.BRANCH_NAME}"
        }
        failure {
            echo "Build failed: ${env.JOB_NAME} for branch: ${env.BRANCH_NAME}"
        }
    }
}
