pipeline {
    agent { label 'JDK11' }
    // triggers { 
    //     cron('0 * * * *') 
    //     }
    stages {
        stage ('SourceCode') {
            steps {
                git branch: 'main', credentialsId: '06ed9883-6839-494a-8a24-2bff76a3cdbe', url: 'https://github.com/Aparna-Puvvadi/spring-petclinic.git'
            }
        }
        stage ('Build the code and sonarqube analysis') {
            steps {
                withSonarQubeEnv ('SONAR_LATEST') {
                    sh script: "mvn package sonar:sonar"
                }
            }
        }
        
    }
}

