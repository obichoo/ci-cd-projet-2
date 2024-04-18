pipeline {
    agent any
    environment {
        ID_GIT = 'obichoo'
        ID_DOCKERHUB = 'obichooooo'
        IMAGE_NAME = 'ci-cd-projet-2'
        IMAGE_TAG = 'latest'
        USER_MAIL = "${MAIL_TO}"
    }
    stages {
        // stage('Build') {
        //     steps {
        //         script {
        //             sh '''
        //             #!/bin/bash
        //             # Nettoyer le répertoire s'il existe déjà
        //             if [ -d "${IMAGE_NAME}" ]; then
        //                 rm -rf ${IMAGE_NAME}

        //                 if [ "$(docker ps -q -f name=${IMAGE_NAME})" ]; then
        //                     docker stop ${IMAGE_NAME} || true
        //                     docker rm ${IMAGE_NAME} || true
        //                 fi
        //             fi

        //             git clone https://github.com/${ID_GIT}/${IMAGE_NAME}.git
        //             cd ${IMAGE_NAME}

        //             docker build -t ${ID_DOCKERHUB}/${IMAGE_NAME}:${IMAGE_TAG} .
        //             '''
        //         }
        //     }
        // }
        // stage('Test') {
        //     steps {
        //         script {
        //             sh '''
        //                 docker run -d -p 8081:8081 -e PORT=8081 --name ${IMAGE_NAME} ${ID_DOCKERHUB}/${IMAGE_NAME}:${IMAGE_TAG}
        //                 sleep 5
        //                 curl http://172.17.0.1:8081
        //             '''
        //         }
        //     }
        // }
        // stage('Artifact') {
        //     steps {
        //         script {
        //             // Logging into Docker Hub 
        //             withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_LOGS', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
        //                 sh 'echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin'
        //             }
        //             // Pushing the image to Docker Hub
        //             sh 'docker push ${ID_DOCKERHUB}/${IMAGE_NAME}:${IMAGE_TAG}'
        //         }
        //     }
        // }
        stage('Deploy') {
            steps {
                script {
                    sh '''
                        mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
                        eval "$(homebrew/bin/brew shellenv)"
                        brew update --force --quiet
                        chmod -R go-w "$(brew --prefix)/share/zsh"
                        brew tap render-oss/render
                        brew install render
                    '''
                }
            }
        }
    }
    // post {
    //     always {
    //         mail to: "${USER_MAIL}",
    //             subject: "Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}",
    //             body: "Check Jenkins for details. Build number: ${env.BUILD_NUMBER}"
    //     }
    // }
}
