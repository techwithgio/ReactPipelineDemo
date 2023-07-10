pipeline {
  agent {
      docker { image 'node:18.16.0-alpine' }
  }
    
  tools {nodejs "node"}
    
  stages {
        
    stage('Environment') {
      steps {
        sh 'git --version'
        echo "Branch: ${env.BRANCH_NAME}"
        sh 'docker -v'
        sh 'printenv'
      }
    }
     stage('Install dependencies') {
      steps {
        sh 'npm install'
      }
    }
    stage('Build Docker test'){
      steps{
        sh 'docker build -t react-test -f Dockerfile.test --no-cache .'
      }
    }  
    stage('Docker test'){
      steps {
        sh 'docker run --rm react-test'
      }
    }
    stage('Clean Docker test'){
      steps{
        sh 'docker rmi react-test'
      }
    }
    stage('Test') {
      steps {
         sh 'npm test'
      }
    }      
  }
}