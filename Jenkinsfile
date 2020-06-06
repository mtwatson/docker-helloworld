pipeline {
    environment {
        registry = "mtwatson/udacity-docker-final"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
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
             }
         }
         stage('Publish') {
             steps {
                withDockerRegistry([ credentialsId: 'dockerhub', url: '' ]) {
                    sh '''
                        dockerpath="mtwatson/udacity-docker-final"
                        sudo docker push mtwatson/udacity-docker-final
                    '''
                }
             }
         }
     }
}
