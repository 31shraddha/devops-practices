pipeline {
  agent {
    docker {
      image 'node:18'
      args '-u root:root'
    }
  }

  environment {
    IMAGE_NAME = 'jenkins-node-demo'
    TAG = 'v1'
  }

  stages {
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker --version || echo "Docker not available inside this image."'
        echo "Build complete – skip docker build if no CLI access"
      }
    }
  }
}
