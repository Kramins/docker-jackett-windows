pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        powershell(returnStatus: true, script: '.\\build.ps1')
      }
    }
    stage('Test') {
      steps {
        echo 'Testing..'
      }
    }
    stage('Push To Docker') {
      when {
        branch 'master'
      }
      steps {
        withDockerRegistry([credentialsId: "dockerhub",  url: "" ]){
            powershell(returnStatus: true, script: '.\\push.ps1')
        }
        
      }
    }
  }
}