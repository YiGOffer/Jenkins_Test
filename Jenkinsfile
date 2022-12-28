pipeline {
    agent any
    triggers {
        GenericTrigger(
            genericVariables: [
                [key: 'branch', value: '$.branch'],
                [key: 'business', value: '$.business'],
            ],
            token: 'pipelineTest' ,
            causeString: 'Triggered on $branch and $business' ,
            printContributedVariables: true,
            printPostContent: true
        )
    }
    
    stages {
        stage('show-param') {
            steps {
                echo "公司信息：$business"
                echo "代码分支：$branch"
                sh 'ls -l'
            }
        }        stage('show-param') {

        }
        stage("select_git_branch_test") {
            steps {
            build job: "select_git_branch_test", parameters: [
                [$class: "StringParameterValue", name: "branch", value: "${branch}"],
                [$class: "StringParameterValue", name: "business", value: "${business}"]
            ]
            }
        }
    }

}
