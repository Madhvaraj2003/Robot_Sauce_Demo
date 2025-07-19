pipeline {
    agent any

    tools {
        // Assumes Python is available in the system PATH
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/Madhvaraj2003/Robot_Sauce_Demo.git', branch: 'main', credentialsId: 'your-credential-id'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'python -m pip install --upgrade pip'
                bat 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'pytest tests/ --html=report.html'
            }
        }

        stage('Publish Report') {
            steps {
                publishHTML([
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '.',
                    reportFiles: 'report.html',
                    reportName: 'Selenium Test Report'
                ])
            }
        }
    }
}
