pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                echo 'Pulling code from GitHub...'
            }
        }
        stage('Build') {
            steps {
                bat 'docker build -t vinothinisenniappan/my-web-app:latest .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    bat "docker login -u %USER% -p %PASS%"
                    bat "docker push vinothinisenniappan/my-web-app:latest"
                }
            }
        }
        stage('Deploy') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}