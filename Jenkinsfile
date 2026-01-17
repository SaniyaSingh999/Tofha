pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/SaniyaSingh999/Tofha'
            }
        }

        stage('Terraform Security Scan') {
            steps {
                sh 'docker run --rm -v ${PWD}:/project aquasec/trivy config /project/terraform'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                cd terraform
                terraform init
                terraform plan
                '''
            }
        }
    }
}
