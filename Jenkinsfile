pipeline {
    agent any
    
environment {
    dockerhub=credentials('dockerhub')
    }
    
    
    stages {
        
        stage('checkout-pullingcode-github') {
            steps {
                sh 'sudo rm -rf /var/lib/jenkins/workspace/FitApp_production_deployment/FitApp'
                sh 'git clone https://github.com/mubeen507/FitApp.git '
                echo 'code pulled '
            }   
            }
        
        stage('build image') {
            steps {
                sh 'pwd'
                sh 'cd FitApp'
                sh 'pwd'
                sh 'docker build -t mubeen507/FitApp -f /var/lib/jenkins/workspace/FitApp_production_deployment/FitApp .'
                echo 'FitApp image is build '
            }
            }
        
        stage('Docker Login') { 
            steps {
                sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
            }
          }
          
         stage('Docker Push') {  
            steps {
                sh 'docker push mubeen507/FitApp'
            }
          }
        
        stage('Removing old docker container') {
            steps {
                
                sh 'docker container rm  FitAppcont -f'
                }
              }
              
        stage('Running the docker container') {
            steps {
                sh 'docker run -d  --name FitAppcont -p 80:80 mubeen507/FitApp'
                }
              } 
              
        
    }
}