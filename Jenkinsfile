pipeline {
    agent any
    stages {
        stage('Build-Docker-Image') {
          steps {
            
              sh 'docker build -t ss69261/testing-image:latest .'
            
          }
        }      
      }
}

