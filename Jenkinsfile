pipeline {
    agent any
    tools {
        maven 'maven'
    }
    
    stages {
        stage('git checkout') {
            steps{
                script{
                    git branch: 'master', url: 'https://github.com/javeed1111/SimpleCucumberProj.git'
                }
            }
        }
        stage ('unit testing'){
            steps{
                sh 'mvn test'
            }
        }
        stage ('sonar code analysis'){
            steps{
                script{
                     withSonarQubeEnv(credentialsId: 'sonar-api') {
                        sh 'mvn clean install sonar:sonar'
                    }
                }
            }
        }
        stage('nexus artifact upload'){
            steps {
                script {
                    nexusArtifactUploader artifacts:
                    [
                        [
                            artifactId: 'CucumberTestNG', 
                            classifier: '',
                            file: 'target/CucumberTestNG-1.0-SNAPSHOT.jar',
                            type: 'jar'
                        ] 
                    ],
                            credentialsId: 'nexus',
                            groupId: 'org.testProj',
                            nexusUrl: '34.16.150.227:8081/', 
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            repository: 'java',
                            version: '1.0-SNAPSHOT'
                }
            }
        }
        stage('docker build'){
            steps{
                sh "docker build -t jvd"
            }
        }
        stage('docker host'){
            steps{
                sh "docker run -itd -p 8055:8080 jvd"
            }
        }

    }
}    
