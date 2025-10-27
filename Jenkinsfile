pipeline {
  agent { label 'long-agent' }

  tools {
    git 'git'   // dùng Git tool bạn vừa thêm bằng script
  }

  environment {
    REGISTRY = 'docker.io'
    IMAGE_NAME = 'hello-world'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'r1', url: 'https://github.com/Richardlong98/hello-world.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build("${IMAGE_NAME}:latest")
        }
      }
    }

    stage('Push to DockerHub') {
      steps {
        script {
          docker.withRegistry("https://${REGISTRY}", "dockerhub-cred") {
            dockerImage.push()
          }
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml -f k8s/service.yaml'
      }
    }
  }
}
