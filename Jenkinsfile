pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t my-nginx-image .'
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
