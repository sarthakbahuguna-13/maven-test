pipeline {
    agent any

    environment {
        // Your specific Docker Hub repo
        DOCKER_IMAGE = "sarthak13bahuguna/java-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
        RELEASE_NAME = "java-app"
    }

        stage('Clone Code') {
            steps {
                // No credentialsId needed for a public HTTPS repo
                git branch: 'master', 
                url: 'https://github.com/sarthakbahuguna-13/maven-test.git'
           }
       }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$IMAGE_TAG .'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $DOCKER_IMAGE:$IMAGE_TAG'
                }
            }
        }

        stage('Deploy via Helm') {
            steps {
                // Injecting the kubeconfig secret to talk to the remote host
                withKubeConfig([credentialsId: 'k8s-config']) {
                    sh """
                    helm upgrade --install $RELEASE_NAME ./java-app \
                    --set image.repository=$DOCKER_IMAGE \
                    --set image.tag=$IMAGE_TAG
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful! Check your remote K8s host."
        }
        failure {
            echo "Build failed. Check the console logs for the red stage."
        }
    }
}
