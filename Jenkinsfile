pipeline {
    //Multi-branch
    agent { label 'maven' }
    stages{
        stage('Build war') {
            steps {
              sh 'mvn clean install -DskipTests'
            }
        }
        // Build Docker image
        stage('Build Docker Image') {
            steps {
                sh 'oc start-build spring-petclinic-framework'
            }
        }
        // push docker image to OCR with latest
    }
}
