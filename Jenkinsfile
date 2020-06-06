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
         stage('Lint Dockerfile') {
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
                sh '''
                    sudo docker login -u $USER_CREDENTIALS_USR -p $USER_CREDENTIALS_PSW
                    sudo docker build --tag mtwatson/udacity-docker-final .
                    sudo docker push mtwatson/udacity-docker-final
                '''
             }
         }
     }
}
