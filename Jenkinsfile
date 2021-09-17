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



    }
}
