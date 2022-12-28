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
                echo "项目路径：$WORKSPACE"
                sh 'mkdir -p $WORKSPACE/packRes'
            }
        }       
        stage("select_git_branch_test") {
            steps {
                build job: "python_deb_build", parameters: [
                    [$class: "StringParameterValue", name: "branch", value: "${branch}"],
                    [$class: "StringParameterValue", name: "business", value: "${business}"]
                ]
                
            }
        }
    }

}
