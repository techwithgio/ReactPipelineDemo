pipeline {
  agent any
    
  tools {nodejs "node"}
    
  stages {
        
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
     stage('Install dependencies') {
      steps {
        sh 'npm install'
      }
    }
    stage('Build Docker test'){
     sh 'docker build -t react-test -f Dockerfile.test --no-cache .'
    }  
    stage('Docker test'){
      sh 'docker run --rm react-test'
    }
    stage('Clean Docker test'){
      sh 'docker rmi react-test'
    }
    stage('Test') {
      steps {
         sh 'npm test'
      }
    }      
  }
}