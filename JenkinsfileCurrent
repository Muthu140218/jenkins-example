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

        stage("publish to nexus") {
            steps {
                echo "publish to Nexus...."
                sh 'mvn deploy -DdeployOnly'
            }
        }

    }

}


