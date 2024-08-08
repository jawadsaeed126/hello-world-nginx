pipeline {
    agent any
    stages {
        stage('Build-Docker-Image') {
          steps {
            
              // sh 'docker build -t ss69261/testing-image:latest .'
              sh 'buildah bud --isolation chroot -t test -f Dockerfile .'
            
          }
        }      
      }
}
