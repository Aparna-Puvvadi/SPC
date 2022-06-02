pipeline {
    agent any
    triggers { pollSCM('0 * * * *') }
    stages {
        stage('SourceCode') {
            steps {
                git branch: 'main', url: 'https://github.com/Aparna-Puvvadi/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Archive and Test Results') {
            steps {
               junit '**/surefire-reports/*.xml'
               archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
        }
    }
}