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
        // push docker image to OCR with latest
    }
}
