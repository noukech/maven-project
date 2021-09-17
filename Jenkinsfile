pipeline {
    agent any

    stages {
        stage("build & SonarQube analysis") {
            steps {
                withSonarQubeEnv('sonarqube') {
                sh 'mvn clean package sonar:sonar'
                }
            }
        }
         stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
                }
            }
        }
        stage("building docker image") {
            steps {
                sh "docker build -t stephali/tomcat_sonarnavndocker:${env.BUILD_NUMBER} ."
                }
            }
        stage("Pushing Image to Docker Hub") {
            steps {
               sh "docker login -u stephali -p BBrostant1@"
               sh "docker push stephali/tomcat_sonarnavndocker:${env.BUILD_NUMBER}"
                
            }
        }
        stage("Deploying to Tomcat Server") {
            steps {
               sh "docker stop tomcatcont"
               sh "docker rm tomcatcont"
               sh "docker rmi stephali/tomcat_sonarnavndocker:${env.BUILD_NUMBER}"
               sh "docker run -itd --name tomcatcont -p 9090:8080 stephali/tomcat_sonarnavndocker:${env.BUILD_NUMBER}"
   }
}
