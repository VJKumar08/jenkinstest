pipeline {
    agent any

    stages {
        stage('1. Prepare Script') {
            steps {
                echo 'Making health_check.sh executable...'
                sh 'chmod +x health_check.sh'
            }
        }

        stage('2. Check System Info') {
            steps {
                sh './health_check.sh sysinfo'
            }
        }

        stage('3. Check Disk Space') {
            steps {
                sh './health_check.sh disk'
            }
        }

        stage('4. Check Memory') {
            steps {
                sh './health_check.sh memory'
            }
        }
    }

    post {
        success {
            echo 'All tasks passed. Archiving report...'
            archiveArtifacts artifacts: 'health_report.txt', fingerprint: true
        }
        failure {
            echo 'Pipeline stopped because a task failed.'
        }
    }
}
