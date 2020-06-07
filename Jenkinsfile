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
         stage('Lint Code') {
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
         stage('Deploying') {
            steps {
                withAWS(credentials: 'aws-cred', region: 'us-east-2') {
                    sh "aws eks --region us-east-2 update-kubeconfig --name ridiculous-outfit-1591456936"
                    sh "kubectl config use-context arn:aws:eks:us-east-2:406472470974:cluster/ridiculous-outfit-1591456936"
                    sh "kubectl set image deployments/udacity-docker-final mtwatson/udacity-docker-final=mtwatson/udacity-docker-final:latest"
                    sh "kubectl apply -f deployment.yml"
                }
            }
         }
         stage('Clean Up') {
             steps {
                sh "docker system prune"
             }
         }
     }
}
