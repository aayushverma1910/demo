@Library('TerraformCD@v0.1') _

def cdpipeline = new terra.templates.terraformCD()

node {
    def repoUrl = 'https://github.com/nikita647/terraform_infra.git'
    def branch = 'main'
    def gitPassword = 'git-cred'
    def terraformPath = "${WORKSPACE}"
    def terraformHome = tool 'terraform'
    env.PATH = "${terraformHome}/bin:${env.PATH}"

    properties([
        parameters([
            choice(name: 'action', choices: ['apply', 'destroy'], description: 'Choose any one option'),
            string(name: 'tfvarsFile', defaultValue: '', description: 'Terraform .tfvars file (optional)')
        ])
    ])

    def message = (params.action == 'apply') ? 'Approval for infrastructure apply' : 'Approval for infrastructure destroy'

    cdpipeline.call(repoUrl, branch, gitPassword, terraformPath, message, params.action, params.tfvarsFile)
}
