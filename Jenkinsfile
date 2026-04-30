pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
              
                git branch: 'main', url: 'https://github.com/vinothinisenniappan/auto_deploy.git'
            }
        }
        stage('Build Image') {
            steps {
             
                bat 'E: && cd E:\\devops_2026 && docker build -t vinothinisenniappan/my-web-app:latest .'
            }
        }
        stage('Push to Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        bat "docker login -u %USER% -p %PASS%"
                        bat "E: && cd E:\\devops_2026 && docker push vinothinisenniappan/my-web-app:latest"
                    }
                }
            }
        }
        stage('Deploy & Refresh') {
            steps {
                
                bat 'E: && cd E:\\devops_2026 && kubectl apply -f deployment.yaml --kubeconfig=C:\\Users\\vinot\\.kube\\config --validate=false'
                
                
                bat 'kubectl rollout restart deployment my-web-app --kubeconfig=C:\\Users\\vinot\\.kube\\config'
            }
        }
    }
}