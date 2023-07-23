pipeline {
  agent any
    
  tools {nodejs "node"}
  environment {
    imagename = "techwithgio/reactapp"
    registryCredential = 'techwithgio'
    dockerImage = ''
  }
    
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
    stage('Test') {
      steps {
         sh 'npm test'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds') {
            dockerImage.push("${env.BUILD_NUMBER}")
            // dockerImage.push("latest")
        }

          // docker.withRegistry( '', registryCredential ) {
          //   dockerImage.push("$BUILD_NUMBER")
          //    dockerImage.push('latest')
          // }
        }
      }
    }
    // stage('Build Docker test'){
    //   steps{
    //     sh 'docker build -t react-app -f Dockerfile --no-cache .'
    //   }
    // }  
    //  stage('Deploy Docker'){
    //   when {
    //     branch 'main'
    //   }
    //   steps {
    //     sh 'docker build -t react-app --no-cache .'
    //     sh 'docker tag react-app localhost:5000/react-app'
    //     sh 'docker push localhost:5000/react-app'
    //     sh 'docker rmi -f react-app localhost:5000/react-app'
    //   }
    // }
    // stage('Docker test'){
    //   steps {
    //     sh 'docker run --rm react-test'
    //   }
    // }
    // stage('Clean Docker test'){
    //   steps{
    //     sh 'docker rmi react-test'
    //   }
    // }
        
  }
}