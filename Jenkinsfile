pipeline {
  agent any

  stages {
    stage('Build') {
      agent {
        docker {
          image 'ruby:3.3.6-slim'
        }
      }
      steps {
        sh '''
          ls -la
          ruby -v
          bundle install
          echo 'Hello World'
          ls -la
        '''
      }
    }
  }
}
