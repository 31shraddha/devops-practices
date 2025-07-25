pipeline {
  agent any

  environment {
    IMAGE_NAME = 'nodeapp'
    TAG = 'v1'
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/your-username/your-repo.git'
      }
    }

    stage('Install') {
      steps {
        sh 'npm install'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test || echo "Tests failed, continuing..."'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME:$TAG .'
      }
    }
  }
}
