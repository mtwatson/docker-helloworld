pipeline {
     agent any
     stages {
         stage('Install Dependencies') {
             steps {
                 sh 'make install-hadolint'
             }
         }
         stage('Lint Dockerfile and Python') {
             steps {
                 sh 'make lint'
             }
         }
         stage('Build') {
             steps {
                 sh 'sudo docker build --tag mtwatson/udacity-docker-final .'
                 sh 'docker image ls'
             }
         }
         stage('Publish') {
             steps {
                withDockerRegistry([ credentialsId: 'dockerhub', url: '' ]) {
                    sh './upload_docker.sh'
                }
             }
         }
     }
}