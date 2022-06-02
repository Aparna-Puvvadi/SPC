pipeline {
    agent { label 'JDK11' }
    // triggers { 
    //     cron('0 * * * *') 
    //     }
    stages {
        stage ('SourceCode') {
            steps {
                git branch: 'main', url: 'https://github.com/Aparna-Puvvadi/spring-petclinic.git'
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

