pipeline {
    agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: docker
            image: 099199746132.dkr.ecr.eu-west-1.amazonaws.com/jenkins-deployment-on-eks-repo:latest
            command:
            - cat
            tty: true
            volumeMounts:
             - mountPath: /var/run/docker.sock
               name: docker-sock
          volumes:
          - name: docker-sock
            hostPath:
              path: /var/run/docker.sock    
        '''
    }
    }
    stages {
        stage('Build-Docker-Image') {
      steps {
        container('docker') {
          sh 'docker build -t ss69261/testing-image:latest .'
        }
      }
    }
        stage('Test') {
            steps {
                script {
                    // Run the Docker container and test it
                    sh '''
                    docker run -d --name my-nginx-container -p 8080:80 my-nginx-image
                    sleep 5
                    curl -I localhost:8080
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deployment steps (for example, pushing the image to a registry)
                    sh '''
                    docker tag my-nginx-image my-dockerhub-username/my-nginx-image:latest
                    docker push my-dockerhub-username/my-nginx-image:latest
                    '''
                }
            }
        }
    }
}
