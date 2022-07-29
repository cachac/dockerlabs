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

		// Docker Build
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -f stage.dockerfile -t cachac/dockerlabs:j1.0 .'
      }
    }
  }
}
