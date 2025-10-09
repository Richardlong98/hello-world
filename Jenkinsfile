pipeline {
  agent any
  environment {
    DOCKERHUB_USER = credentials('dockerhub-user')
    DOCKERHUB_PASS = credentials('dockerhub-pass')
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Richardlong98/hello-world.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $DOCKERHUB_USER/hello-world:latest .'
      }
    }
    stage('Push to DockerHub') {
      steps {
        sh '''
          echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
          docker push $DOCKERHUB_USER/hello-world:latest
        '''
      }
    }
    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml -f k8s/service.yaml'
      }
    }
  }
}
