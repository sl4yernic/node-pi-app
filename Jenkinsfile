pipeline {
    agent any

    stages {
        stage('Install dependencies') {
            steps {
                sh '''
                npm ci
                '''
            }
        }

        stage('Tests') {
            steps {
                sh '''
                    echo "Running syntaX test" 
		    npm test
                '''
            }
        }

        stage('Deploy to Raspberry Pi') {
            steps {
                sshagent(credentials: ['pi-ssh']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no javi@192.168.68.103 \
                      "cd /home/javi/nodejswebapp && ./deploy.sh"
                    '''
                }
            }
        }
    }
}
