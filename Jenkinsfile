pipeline {
    agent any
    stages {
        stage('Build-Docker-Image') {
          steps {
            
              // sh 'docker build -t ss69261/testing-image:latest .'
               sh 'buildah build --isolation chroot -t test -f Dockerfile .'

              
              // Running buildah in rootless mode
              //      sh 'buildah --storage-driver vfs bud --isolation chroot -t test -f Dockerfile .'
              
          }
        }      
      }
}
