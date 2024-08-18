pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'main', credentialsId: 'GIT', url: 'https://github.com/nareshdevopscloud/project-2-maven-jenkins-CICD.git'
            }
        }
        stage('maven install') {
            steps {
                sh 'mvn install'
            }
        }
        stage('deploy to tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'TOMCAT', path: '', url: 'http://3.144.181.216:8081/')], contextPath: 'jan', war: 'target/*.war'
                
            }
        }
    }
}
