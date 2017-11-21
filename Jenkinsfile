pipeline {
    agent none
    stages{
        stage('Build war') {
            agent {
                docker {
                    image 'maven:3.5.0'
                }
            }
            steps {
              sh 'mvn clean install -DskipTests'
            }
        }
        // Build Docker image
        stage('Build Docker Image') {
            agent any
            steps {
                sh "docker build -t 172.30.1.1:5000/myproject/petclinic:latest -f dockerfiles/Jboss ."
            }
        }
        stage('Deploy Docker container') {
            agent any
            steps {
                sh "docker login -u developer -p dqwdwqdq 172.30.1.1:5000"
                sh "docker push 172.30.1.1:5000/myproject/petclinic:latest"
            }
        }
    }
}
