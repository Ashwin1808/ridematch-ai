pipeline {
    agent any

    environment {
        DOCKER_USERNAME = "ashwindocker1808"
        BACKEND_IMAGE = "ashwindocker1808/ridematch-backend"
        FRONTEND_IMAGE = "ashwindocker1808/ridematch-frontend"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Backend Image') {
            steps {
                sh 'docker build -t $BACKEND_IMAGE:latest ./backend'
            }
        }

        stage('Build Frontend Image') {
            steps {
                sh 'docker build -t $FRONTEND_IMAGE:latest ./frontend'
            }
        }

        stage('Login DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Images') {
            steps {

                sh '''
                docker push $BACKEND_IMAGE:latest
                docker push $FRONTEND_IMAGE:latest
                '''

            }
        }

    }

    post {

        success {
            echo 'Docker images pushed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

    }

}