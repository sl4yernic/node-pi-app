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
                if npm run | grep -q " test"; then
                  npm test
                else
                  echo "No test script defined, skipping tests."
                fi
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
