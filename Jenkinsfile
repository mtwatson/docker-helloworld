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
                    sh '''
                        dockerpath="mtwatson/udacity-docker-final"
                        dockerId=$(docker images --format="{{.Repository}} {{.ID}}" | grep "^mtwatson/udacity-docker-final " | cut -d' ' -f2)
                        sudo docker commit $dockerId mtwatson/udacity-docker-final
                        sudo docker push $dockerpath
                    '''
                }
             }
         }
     }
}