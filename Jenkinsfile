pipeline {
    environment {
        USER_CREDENTIALS = credentials('dockerhub');
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
                // withDockerRegistry([ credentialsId: 'dockerhub', url: '' ]) {
                //     sh '''
                //         dockerpath="mtwatson/udacity-docker-final"
                //         sudo docker push mtwatson/udacity-docker-final
                //     '''
                // }
                sh '''
                    sudo docker login -u $USER_CREDENTIALS_USR -p $USER_CREDENTIALS_PSW
                    sudo docker build --tag mtwatson/udacity-docker-final .
                '''
             }
         }
     }
}
