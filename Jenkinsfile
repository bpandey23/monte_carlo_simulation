pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'Rscript -e "install.packages(c('devtools', 'testthat'), repos='http://cran.rstudio.com/'))'
            }
        }

        stage('Build') {
            steps {
                sh 'R CMD build .'
            }
        }

        stage('Test') {
            steps {
                sh 'Rscript -e "devtools::test()"'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy steps, e.g., packaging and uploading the built package
            }
        }
    }
}