pipeline {
  agent {  node {  label 'workstation'}
  parameters {
          string(name: 'COMPONENT', defaultValue: '', description: 'Which component')
          string(name: 'ENV', defaultValue: '', description: 'Which environment')
          string(name: 'APP_VERSION', defaultValue: '', description: 'Which version')
  }

  stages {
    stage('Get Servers') {
          steps {
            sh 'aws ec2 describe-instances --filters "Name=tag:Name,Values=${COMPONENT}-${ENV}" --query "Reservations[*].Instances[*].PrivateIpAddress" --output text |xargs -n1>inv'
          }
        }

        stage('Deploy Application') {
          steps {
            sh 'ansible-playbook -i inv roboshop-ansible/main.yml  -e role_name=${COMPONENT} -e env=${ENV} -e app_version=${APP_VERSION} -e ansible_user=centos -e ansible_password=DevOps321 -e "ansible_ssh_timeout=30"'
          }
        }

    }

  }
}