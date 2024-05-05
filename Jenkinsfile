pipeline {
    agent any
    
environment {
    dockerhub=credentials('dockerhub')
    }
    
    
    stages {
        
        stage('checkout-pullingcode-github') {
            steps {
                sh 'sudo rm -rf /var/lib/jenkins/workspace/fitapp_production_deployment/fitapp'
                sh 'git clone https://github.com/mubeen507/fitapp.git '
                echo 'code pulled '
            }   
            }
        
        stage('build image') {
            steps {
                sh 'pwd'
                sh 'cd fitapp'
                sh 'pwd'
                sh 'docker build -t mubeen507/fitapp -f /var/lib/jenkins/workspace/fitapp_production_deployment/fitapp .'
                echo 'fitapp image is build '
            }
            }
        
        stage('Docker Login') { 
            steps {
                sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
            }
          }
          
         stage('Docker Push') {  
            steps {
                sh 'docker push mubeen507/fitapp'
            }
          }
        
        stage('Removing old docker container') {
            steps {
                
                sh 'docker container rm  fitappcont -f'
                }
              }
              
        stage('Running the docker container') {
            steps {
                sh 'docker run -d  --name fitappcont -p 80:80 mubeen507/fitapp'
                }
              } 
              
        
    }
}