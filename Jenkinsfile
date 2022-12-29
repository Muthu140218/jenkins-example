pipeline
{
    agent any


    stages {

        stage('checkout') {
            steps {

                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Muthu140218/jenkins-example.git']]])

            }
        }
        stage('compile') {
             steps {
                echo "Compiling code...."
                sh 'mvn --version'
                sh 'mvn -Dmaven.test.skip=true clean install'
             }
        }

        stage("Create Image") {
            steps {
                echo "Docker image creation...."
                sh 'mvn docker:build'
            }
        }

        stage("Publish Docker Image to Nexus") {
            steps {
                echo "Publish image to nexus...."
                sh 'docker login -u admin -p admin'
                sh 'mvn docker:push'
            }
         }

    }

}


