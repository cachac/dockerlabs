#!groovy

pipeline {
  agent none
  stages {
    stage('Node') {
      agent {
        docker {
          image 'node:lts-bullseye-slim'
        }
      }
      steps {
        sh 'npm install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t shanem/spring-petclinic:latest .'
      }
    }
  }
}
