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
                //openshiftBuild(bldCfg: 'spring-petclinic', showBuildLogs: 'true')
                docker build .
            }
        }
        // push docker image to OCR with latest
    }
}
