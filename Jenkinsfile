#!groovy

pipeline {
  agent none
  stages {
    // stage('Node Build') {
    //   agent {
    //     docker {
    //       image 'node:lts-bullseye-slim'
    //     }
    //   }
    //   steps {
    //     sh 'npm install'
    //   }
    // }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t cachac/dockerlabs:j1.0 .'
      }
    }
  }
}
