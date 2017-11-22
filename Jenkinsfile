pipeline {
    agent none
    stages{
        // Build Docker image
        stage('Build Docker Image') {
            agent any
            steps {
                sh "s2i build . openshift/wildfly-101-centos7 petclinic"
            }
        }
    }
}
