pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "tetris"
        DOCKER_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vitrubnikova/CppTetris-test-for-pvs.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run -e DISPLAY=host.docker.internal:0 --name tetris ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        success {
            emailext (
                subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: 'Build успешно завершен!',
                to: 'vitrubnikova@gmail.com'
            )
        }
        failure {
            emailext (
                subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """<p>Build завершился с ошибкой! Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at &quot;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&quot;</p>""",
                to: 'vitrubnikova@gmail.com'
            )
        }
    }
}