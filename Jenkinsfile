pipeline{
    agent any
    stages{
        stage ('source code') {
            steps{
                git branch: 'main', credentialsId: 'GIT', url: 'https://github.com/Aparna-Puvvadi/SPC.git'
            }
        }
        stage ('build') {
            steps{
                 sh 'mvn clean package'
            }
        }
        stage ('build docker image') {
            steps{
              withCredentials([string(credentialsId: 'DOCKER_CREDENTIALS', variable: 'DOCKER_HUB_CREDENTIALS')]) {
                sh "docker login -u aparnapuvvadi -p ${DOCKER_HUB_CREDENTIALS}"
             }
                sh "docker push aparnapuvvadi/myspc"
            }
        }
        // stage ('Deploy application in K8s') {
        //     steps{
        //         kubernetesDeploy(
        //             configs: 'spc_deploy.yml',
        //             kubeconfijId: 'K8S_CLUSTER_CONFIG',
        //             enableConfigSubstitution: true
        //         )

        //     }
        // }
    }
}